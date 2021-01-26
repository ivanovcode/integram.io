<?php

namespace Facebook\WebDriver;

use Facebook\WebDriver\Remote\DesiredCapabilities;
use Facebook\WebDriver\Remote\RemoteWebDriver;
use Facebook\WebDriver\Chrome\ChromeOptions;
use Facebook\WebDriver\Exception\TimeoutException;
use Facebook\WebDriver\Exception\NoSuchElementException;

function findElementByCssInElement($driver, $element, $css) {
	try {
		$element = $element->findElement(WebDriverBy::cssSelector($css));
		return $element;
	}
	catch (NoSuchElementException $e) {
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
		    WebDriverExpectedCondition::presenceOfElementLocated(WebDriverBy::id($id))
		);
		return $element;
	}
	catch (TimeOutException $e) {
	    return false;
	}
	catch (Exception $e) {
	    return false;
	}	
	return false;
}

require_once('vendor/autoload.php');

$driver = RemoteWebDriver::create("http://selenoid:4444/wd/hub",
	array("browserName"=>"chrome", "browserVersion"=>"76.0")
);

/*$options = new ChromeOptions();
$options->addArguments(["window-size=1920,1080", "--headless","--disable-gpu", "--no-sandbox"]);
$caps = DesiredCapabilities::chrome();
$caps->setCapability(ChromeOptions::CAPABILITY, $options);
$caps->setPlatform("Linux");
$host = 'http://selenoid:4444/wd/hub/';

$driver = RemoteWebDriver::create($host, $caps);*/
$driver->get('https://vk.com/public165829339');

$popupAuth = waitElementById($driver, 'box_layer_wrap');
if ($popupAuth) {
	$popupAuthClose = findElementByCssInElement($driver, $popupAuth, 'a.JoinForm__notNow');
	if ($popupAuthClose) {
		echo "Окно авторизации закрыто"."\n";
		$popupAuthClose->click();
	}	
}

$driver->takeScreenshot('screenshot.png'); 


while (true) {	
	$elements = $driver->findElements(WebDriverBy::cssSelector('div._post'));
	foreach ($elements as $element) {
		$id = $element->getAttribute('id');
		$rel_date = $element->findElement(WebDriverBy::cssSelector('span.rel_date'))->getText();
		//echo $id . '-' . $rel_date."\n";	
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