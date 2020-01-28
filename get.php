<?php
use model\Filter;

spl_autoload_register();
$kat = $_POST["kategorie"];
$entf = $_POST['entfernung'];
$preis = $_POST['preis'];
$veggie = $_POST['veggietauglich'];
$filt = new Filter($kat,$entf,$preis,$veggie);
$filt->getRestaurants($filt);



