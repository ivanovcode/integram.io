<?php

function typo( $s ){      
	$pattern = '/\s+(в|без|до|из|к|на|по|о|от|перед|при|через|с|у|и|нет|за|над|для|об|под|про|г|это)\s+/';
	return preg_replace($pattern, ' ', $s);
}

function clean_search_string( $s ) {
    $s = preg_replace( "/^[a-zA-Z0-9]+$/", '', $s );
    return $s;
}

function multiexplode ($delimiters, $string) {
    $ready = str_replace($delimiters, $delimiters[0], $string);
    $launch = explode($delimiters[0], $ready);
    return  $launch;
}

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

$db->query("SET sql_mode = '';");

$rows = $db->query("
	SELECT * FROM `groups` g GROUP BY g.`title`;
");

if($rows !== false)
{
    $rows = $rows->fetchAll(PDO::FETCH_ASSOC);
}

foreach ($rows as $key => $row) {
	$row['title'] = typo($row['title']);
	$words = multiexplode(array(",",".","|",":"," ","#","-","/","\""), $row['title']);
	foreach ($words as $key => $word) {		
		$word = preg_replace('/[^a-zA-Zа-яА-Я_ 0-9]/ui', '', $word);	
		$word = mb_strtolower($word);	
		if (!empty($word) && strlen($word) > 2) {			
			//echo $word . "\n";
			$db->query("INSERT INTO `words` VALUES (NULL, '" . $word . "', 1) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(`id`), `counts` = `counts` + 1");
		}

		//$id = $db->lastInsertId();
	}	
}

$rows = $db->query("
	SELECT w.title as word, w.counts as weight FROM `words` w WHERE w.counts > 0 ORDER BY w.counts DESC;
");
$rows = $rows->fetchAll(PDO::FETCH_ASSOC);


file_put_contents("data.json", json_encode($rows, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
$db = null;