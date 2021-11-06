<?php

$countryCodes = [];
$doc = new DOMDocument();

$doc->loadHTMLFile('currencies-table.html');
$xpath = new DOMXPath($doc);
$trs = $xpath->query("/html/body/table/tbody/tr"); // DOMNodeList

foreach ($trs as $tr) { // $tr DOMElement
    $tds = $xpath->query($tr->getNodePath() . '/td');
    $countryCodes[$tds->item(0)->nodeValue] = $tds->item(1)->nodeValue;
}

var_dump($countryCodes);

