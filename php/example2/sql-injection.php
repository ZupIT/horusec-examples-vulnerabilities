<?php
// Copyright 2021 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


if (PHP_SAPI === 'cli') {
    parse_str(implode('&', array_slice($argv, 1)), $_GET);
}

$file_db = new PDO('sqlite:../database/database.sqlite');

if (NULL == $_GET['id']) $_GET['id'] = 1;

$sql = 'SELECT * FROM employees WHERE employeeId = ' . $_GET['id'];

foreach ($file_db->query($sql) as $row) {
    $employee = $row['LastName'] . " - " . $row['Email'] . "\n";

    echo $employee;
}
