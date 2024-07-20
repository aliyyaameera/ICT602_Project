<?php 
//simple database to json conversion script
// Writen by Mohammad Hafiz bin Ismail

/***
    Copyright (c) 2021 by Mohammad Hafiz bin Ismail (mypapit@gmail.com)
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this list
    of conditions and the following disclaimer.

    2. Redistributions in binary form must
    reproduce the above copyright notice, this list of conditions and the following
    disclaimer in the documentation and/or other materials provided with the
    distribution.

    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
    REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
    FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
    INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
    OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
    TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
    THIS SOFTWARE.
***/

require_once('db.php');

$state = isset($_GET['state']) ? $_GET['state'] : '';

// Prepare the SQL query with the state filter
$query = "SELECT * FROM events";
if ($state) {
    $query .= " WHERE state = '" . mysqli_real_escape_string($link, $state) . "'";
}

$result = mysqli_query($link, $query);

// Declare array
$output = array();

// Add rows to the array for each record
foreach ($result as $row) {
    array_push($output, $row);
}

// Assign to JSON variable
$json = json_encode($output);

// Declare document type to JSON and output JSON
header("Content-Type: application/json");
echo $json;
?>
