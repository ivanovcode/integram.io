<?php
function strReplaceForArray($list, $string) {
	$find       = array_keys($list);
	$replace    = array_values($list);
	$new_string = str_ireplace($find, $replace, $string);
	return $new_string;
}

function normalizeDate($string) {
	return str_replace("&nbsp;", " ", $string);
}

function getMonthDate($string) {	
	$listMonth = array(
		"янв" => "01", "фев" => "02", "мар" => "03", "апр" => "04", "мая" => "05", "июн" => "06", "июл" => "07", "авг" => "08", "сен" => "09", "окт" => "10", "ноя" => "11", "дек" => "12"
	);	
	$listMonthForDay = array(
		"вчера" => date('m', strtotime("-1 days")), 
		"сегодня" => date("m"), 
		"назад" => date("m")
	);
	$words = explode(" ", $string);
	foreach ($words as $key => $word) {
		$isMonth = array_key_exists($word, $listMonth);
		$isMonthForDay = array_key_exists($word, $listMonthForDay);
		$month = ($isMonth ? strReplaceForArray($listMonth, $word) : ($isMonthForDay ? strReplaceForArray($listMonthForDay, $word) : ""));
		if (!empty($month)) return $month;
	}	
	return ""; //date("Y-m-d H:i:s");
}

function getYearDate($string) {	
	$month = intval(getMonthDate($string));
	$todayMonth = intval(date("m"));
	$words = explode(" ", $string);
	foreach ($words as $key => $word) {
		if (is_numeric($word) && strlen($word) === 4) {
			return $word;
		}		
	}	
	return $todayMonth < $month ? date('Y', strtotime("-1 year")) : date("Y");		
}

function getTimeDate($string) {	
	$listNumber = array(
		"час" => "1", 
		"один" => "1", 
		"два" => "2",
		"три" => "3", 
		"четыре" => "4", 
		"пять" => "5", 
		"шесть" => "6", 
		"семь" => "7", 
		"восемь" => "8", 
		"девять" => "9"
	);
	$minuteNumber = "";
	$words = explode(" ", $string);
	foreach ($words as $key => $word) {
		if (strripos($word, "минут") && is_numeric($word) && strlen($word) > 1) {
			$minuteNumber = $word;
		}
		if (strripos($word, ":") && strlen($word) >= 4) {
			return $word;
		}		
		$isNumber = array_key_exists($word, $listNumber);
		$number = $isNumber ? strReplaceForArray($listNumber, $word) : ""; 
		if (!empty($number)) return date('H:i:s', strtotime('-'.$number.' hour'));	
	}	
	return !empty($minuteNumber) ? date('H:i:s', strtotime('-'.$minuteNumber.' minutes')) : "00:00:00";		
}

function getDayDate($string) {	
	$listDay = array(
		"вчера" => date('d', strtotime("-1 days")), 
		"сегодня" => date("d")
	);
	$words = explode(" ", $string);
	foreach ($words as $key => $word) {		
		if (is_numeric($words[0]) && strlen($word) >= 1 && !strripos($word, "назад")) {
			return $word;
		}	
		$isDay = array_key_exists($word, $listDay);
		$day = $isDay ? strReplaceForArray($listDay, $word) : ""; 
		if (!empty($day)) return $day;		
	}	

	return date("d");		
}

function formatDate($rel_date) {
	$time = " " . "00:00";
	$arr_date = explode(" ", $rel_date);
	$currentyear = isset($arr_date[3]) && !is_numeric($arr_date[3]) ? date("Y") : $arr_date[3];
	if (count($arr_date) > 3) {
		$time = " " . $arr_date[3] . ":00";
	}

	$arr_date[1] = strReplaceForArray(array(
		"янв" => "01", "фев" => "02", "мар" => "03", "апр" => "04", "мая" => "05", "июн" => "06", "июл" => "07", "авг" => "08", "сен" => "09", "окт" => "10", "ноя" => "11", "дек" => "12"
	), $arr_date[1]);

	$str_date = count($arr_date) > 3 ? $currentyear . "-" . $arr_date[1] . "-". $arr_date[0] . $time : $arr_date[2] . "-" . $arr_date[1] . "-". $arr_date[0] . $time;
	//return date("Y-m-d", strtotime($str_date));
	return $str_date;
}
function findElementsByCssInElement($driver, $element, $css) {
	try {
		$element = $element->findElements(Facebook\WebDriver\WebDriverBy::cssSelector($css));
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

function executeScriptWait($driver, $count) {
	try {
		$driver->wait(10, 500)->until(
		    function ($driver) use ($count)  {
		        return $driver->executeScript('return document.getElementById("page_wall_posts").getElementsByClassName("post").length > ' . strval($count));
		    }
		); 	
		return true;
	}
	catch (Facebook\WebDriver\Exception\TimeoutException $e) {
	    return false;
	}
	catch (Exception $e) {
	    return false;
	}	
	return false;
}

function getUrl($driver, $url) {
	try {
		return $driver->get($url);
	}
	catch (Facebook\WebDriver\Exception\WebDriverCurlException $e) {
	    return false;
	}
	catch (Exception $e) {
	    return false;
	}	
	return false;
}

define('DIR', __DIR__  . '/'); define('APP', __DIR__  . '/app'); 

require_once(DIR  . 'vendor/autoload.php');

if (!class_exists('Dotenv\Dotenv')) die('Dotenv\Dotenv don`t exists');

$dotenv = Dotenv\Dotenv::create(DIR); $dotenv->load(); 
$config = parse_ini_file(APP . '/config.ini', true);

try { 
	$db = new PDO("mysql:host=".getenv('DB_HOST').";dbname=".getenv('DB_NAME'), getenv('DB_USER'), getenv('DB_PASSWORD')); 
	$db->query("SET NAMES utf8");  
} catch (PDOException $error) { 
	die('MySQL don`t connect');
}

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
	//echo "Обнаружено всплывающее окно" . "\n";
	$popupClose = findElementByCssInElement($driver, $popup, 'div.box_x_button'); //a.JoinForm__notNow
	if ($popupClose) {
		echo "Окно закрыто" . "\n";
		$popupClose->click();
	}	
}

$db->query("SET sql_mode = '';");

$rows = $db->query("
	SELECT * FROM `groups` g GROUP BY g.`title`;
");

if($rows !== false)
{
    $rows = $rows->fetchAll(PDO::FETCH_ASSOC);
}

foreach ($rows as $key => $row) {	
	$r = 0;	do { $r++;
		$d = getUrl($driver, $row['name']); 
		echo "Запрос [" . strval($r) . "] к группе " . strval($key + 1) . " из " . count($rows) . ": \"" . $row['title'] . "\"" . "\n";
	} while ($d === false);	$driver = $d; unset($d);

	$results_page_el = waitElementById($driver, 'page_wall_posts');

	$count = 0;
	$i = 0; while (true) { $i++;
		$xpath = 'div.post:nth-child(n+' . strval($count + 1) . ')';	
		$interation = 0;	
		$elements = findElementsByCssInElement($driver, $driver, $xpath);
		$filtred = 0;
		
		if ($elements) {
			$count = $count + count($elements);
			foreach ($elements as $key => $element) {
				$post_link = findElementByCssInElement($driver, $element, 'a.post_link');
				$post_link = $post_link ? $post_link->getAttribute("href") : "";
			
				$copy_quote = findElementByCssInElement($driver, $element, 'div.copy_quote');

				$rel_date = findElementByCssInElement($driver, $element, 'span.rel_date');
				$rel_date = $rel_date ? $rel_date->getAttribute("innerHTML") : "";

				$content_el = findElementByCssInElement($driver, $element, 'div.wall_post_text');
				$content = strip_tags($content_el ? $content_el->getAttribute("innerHTML") : "");
				
				$normalizeDate = normalizeDate($rel_date);
				$datepublic = getYearDate($normalizeDate) . "-" . getMonthDate($normalizeDate) . "-" . getDayDate($normalizeDate) . " " . getTimeDate($normalizeDate);
				
				if (
					$config['extraction.posts']['interation.only.day'] === 'false' ||
					($config['extraction.posts']['interation.only.day'] !== 'false' && 
					(date('d.m.Y', strtotime($datepublic)) == date("d.m.Y", strtotime(strval($config['extraction.posts']['interation.only.day']) . " days")) || date('d.m.Y', strtotime($datepublic)) == date("d.m.Y")))
				) {
					$filtred++;
					echo "▸ " . $rel_date . " | " . $datepublic . " | "  . substr($content, 0, 30) . "... " . "\n";
					$query = "INSERT IGNORE INTO `posts` VALUES (NULL, '" . date("Y-m-d H:i:s") . "', '" . $datepublic . "', '" . $rel_date . "', '" . $content . "', " . $row['id'] . ", '" . ($copy_quote ? "Репост" : "Пост") . "', '" . $post_link . "');";			
					$db->query($query);
				} else {
					$interation++;
				}

			}
		} else {
			echo "Группа закрыта!" . "\n";
			echo "-----" . "\n";
			break;
		}
		
		if (count($elements) > 0) {			
			echo "Постов на странице за интерацию [".strval($i)."]: " . count($elements) . ", а с учетом фильтров - " . strval($filtred) . "\n";
			echo "Итого найдено: " . $count . " постов" . "\n";	
		} else {
			echo "Интерация [".strval($i)."] пропущена" . "\n";
		}
		
		if (
			($config['extraction.posts']['interation.only.day'] === 'false' && $i == $config['extraction.posts']['interation']) ||
			($config['extraction.posts']['interation.only.day'] !== 'false' && $interation >= 5)
		) {
			echo "-----" . "\n";
			break;
		} 
		
		$driver->executeScript('window.scrollTo(0, document.body.scrollHeight);');
		executeScriptWait($driver, $count);
	}	
}

$driver->quit();
$db = null;