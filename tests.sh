#!/bin/bash

sudo chown -R 82:82 .

sudo docker-compose up -d mariadb
sudo docker-compose up -d nginx

sudo docker-compose run --user 82 php vendor/bin/phpunit -c core core/tests/Drupal/Tests/Core/Password/PasswordHashingTest.php
sudo docker-compose run --user 82 php vendor/bin/phpunit -c core core/tests/Drupal/KernelTests/Component/Utility/SafeMarkupKernelTest.php
sudo docker-compose run --user 82 php vendor/bin/phpunit -c core core/tests/Drupal/FunctionalTests/Breadcrumb/Breadcrumb404Test.php

sudo chown -R jenkins:jenkins .

sudo docker-compose down --remove-orphans
