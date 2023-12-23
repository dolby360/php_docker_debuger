<html>
<head>
<link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
</head>
<body>
<h1>Argus CTF Day</h1>
<div id="content">

<form>
Find words containing: <input name=needle><input type=submit name=submit value=Search><br><br>
</form>
<?

$key = "";

if(array_key_exists("needle", $_REQUEST)) {
    $key = $_REQUEST["needle"];
}

if($key != "") {
    passthru("grep -i $key dictionary.txt");
}


?>

</div>
</body>
</html>
