<?php

function findElementByCssInElement($driver, $element, $css) {
	try {
		$element = $element->findElement(Facebook\WebDriver\WebDriverBy::cssSelector($css));
		return $element;
	}
	catch (Facebook\WebDriver\Exception\NoSuchElementException $e) {
	    return false;
	}
	catch (Exception $e) {
	    return false;
	}	
	return false;
}

function waitElementById($driver, $id) {
	try {
		$element = $driver->wait(5, 500)->until(
		    Facebook\WebDriver\WebDriverExpectedCondition::presenceOfElementLocated(Facebook\WebDriver\WebDriverBy::id($id))
		);
		return $element;
	}
	catch (Facebook\WebDriver\Exception\TimeoutException $e) {
	    return false;
	}
	catch (Exception $e) {
	    return false;
	}	
	return false;
}

/*$driver = RemoteWebDriver::create("http://selenoid:4444/wd/hub",
	array("browserName"=>"chrome", "browserVersion"=>"76.0")
);*/

define('DIR', __DIR__  . '/');

require_once(DIR  . 'vendor/autoload.php');

if (!class_exists('Dotenv\Dotenv')) die('Dotenv\Dotenv don`t exists');

$dotenv = Dotenv\Dotenv::create(DIR); $dotenv->load(); 

try { 
	$db = new PDO("mysql:host=".getenv('DB_HOST').";dbname=".getenv('DB_NAME'), getenv('DB_USER'), getenv('DB_PASSWORD')); 
	$db->query("SET NAMES utf8");  
} catch (PDOException $error) { 
	die('MySQL don`t connect');
}

/*$options = new Facebook\WebDriver\Chrome\ChromeOptions();
$options->addArguments(["window-size=1920,1080", "--headless","--disable-gpu", "--no-sandbox"]);
$caps = Facebook\WebDriver\Remote\DesiredCapabilities::chrome();
$caps->setCapability(Facebook\WebDriver\Chrome\ChromeOptions::CAPABILITY, $options);
$caps->setPlatform("Linux");
$host = 'http://selenoid:4444/wd/hub/';
$driver = Facebook\WebDriver\Remote\RemoteWebDriver::create($host, $caps);*/

$driver = Facebook\WebDriver\Remote\RemoteWebDriver::create("http://selenoid:4444/wd/hub",
	array("browserName"=>"chrome", "browserVersion"=>"76.0", "selenoid:options"=>array("enableVNC"=>true))
);           

$driver->manage()->window()->setSize(new Facebook\WebDriver\WebDriverDimension(1920,1080));

$driver->get('https://vk.com/login');

$driver->findElement(Facebook\WebDriver\WebDriverBy::id("email"))->sendKeys("+79002889211");
$driver->findElement(Facebook\WebDriver\WebDriverBy::id("pass"))->sendKeys("huj2ov4f");
$driver->findElement(Facebook\WebDriver\WebDriverBy::id("login_button"))->click();

$login_page_el = waitElementById($driver, 'top_profile_link');

$popup = waitElementById($driver, 'box_layer_wrap');  
if ($popup) {
	echo "Обнаружено всплывающее окно" . "\n";
	$popupClose = findElementByCssInElement($driver, $popup, 'div.box_x_button'); //a.JoinForm__notNow
	if ($popupClose) {
		echo "Окно закрыто" . "\n";
		$popupClose->click();
	}	
}
$query = 'сочи походы';
$driver->get('https://vk.com/groups?act=catalog&c%5Blike_hints%5D=1&c%5Bper_page%5D=40&c%5Bq%5D='.$query.'&c%5Bsection%5D=communities');

$results_page_el = waitElementById($driver, 'results');

$total_el = $driver->findElement(Facebook\WebDriver\WebDriverBy::cssSelector('span.page_block_header_count'));
$total = intval(str_replace(" ", "", $total_el->getText()));

//$driver->takeScreenshot('screenshot.png'); 

$count = 0;
$i = 0; while (true) { $i++;
	$xpath = 'div.groups_row:nth-child(n+' . strval($count + 1) . ')';
	$elements = $driver->findElements(Facebook\WebDriver\WebDriverBy::cssSelector($xpath));
	$count = $count + count($elements);

	if ($count == $total) {
		break;
	}

	echo "------------"  . "\n";
	foreach ($elements as $key => $element) {
		$id = $element->getAttribute('id');
		$title_el = $element->findElement(Facebook\WebDriver\WebDriverBy::cssSelector('div.title'));
		$title_el = $title_el->findElement(Facebook\WebDriver\WebDriverBy::cssSelector('a'));
		$info_el = $element->findElement(Facebook\WebDriver\WebDriverBy::cssSelector('div.info'));
		$labeled_el = $info_el->findElement(Facebook\WebDriver\WebDriverBy::cssSelector('div.labeled:last-child'));
		$subscribers = intval(preg_replace('/[^0-9]/', '', $labeled_el->getText()));
		
		$title = $title_el->getText();
		$href = $title_el->getAttribute('href');
		if($key === 0) echo  'Первая группа в интерации: ' . $title . "\n"; 		
		echo $title . " | " . $href . " | " . strval($subscribers) . "\n";
		$db ->query("INSERT IGNORE INTO `groups` VALUES (NULL,'" . $title . "','" . $href . "', '" . $subscribers . "');");
		$id = $db->lastInsertId();
		$db ->query("INSERT IGNORE INTO `groups.queries` VALUES (" . $id . ", 1);");

	}

	/* $scrollHeight = $driver->executeScript('return document.body.scrollHeight;');
	echo 'Высота скроллинга: ' . $scrollHeight . "\n"; */

	if (count($elements) > 0) {
		echo "Групп за интерацию [".strval($i)."]: " . count($elements) . "\n";
		echo "Итого найдено: " . $count . " из " . strval($total)  . " групп" . "\n";	
	} else {
		echo "Интерация [".strval($i)."] пропущена" . "\n";
	}	
	
	//$driver->takeScreenshot('screenshot'.strval($i).'.png'); 
	$driver->executeScript('window.scrollTo(0, document.body.scrollHeight);');

	$driver->wait(10, 500)->until(
	    function ($driver) use ($count)  {
	        return $driver->executeScript('return document.getElementById("results").getElementsByClassName("groups_row").length > ' . strval($count));
	    }
	); 		
}

$driver->quit();
$db = null;
die('end');

while (true) {	
	$elements = $driver->findElements(Facebook\WebDriver\WebDriverBy::cssSelector('div._post'));
	foreach ($elements as $element) {
		$id = $element->getAttribute('id');
		$rel_date = $element->findElement(Facebook\WebDriver\WebDriverBy::cssSelector('span.rel_date'))->getText();
		echo $id . '-' . $rel_date."\n";	
	}

	if (isset($count_posts) && $count_posts == count($elements)) {
		break;
	}
	$count_posts = count($elements);
	echo 'Количество постов: ' . count($elements) ."\n";

	$scrollHeight = $driver->executeScript('return document.body.scrollHeight;');
	//echo 'scrollHeight: ' . $scrollHeight."\n";

	$driver->executeScript('window.scrollTo(0, document.body.scrollHeight);');
	$driver->wait()->until(
	    function ($driver) use ($elements)  {
	        return $driver->executeScript('return document.getElementById("page_wall_posts").getElementsByClassName("_post").length > ' . strval(count($elements)));
	    }
	); 		
}

echo 'Название паблика: ' . $driver->getTitle()."\n";

$driver->quit();
$db = null;