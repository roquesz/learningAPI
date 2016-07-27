<?php
session_start();
require '../vendor/autoload.php';
use classes\Functions;
use classes\Connection;

$c = new \Slim\Container(); //Create Your container

$c['errorHandler'] = function ($c) {
	return function ($request, $response, $exception) use ($c) {
		return $c['response']->withStatus(500)
			->withHeader('Content-Type', 'application/json')
			->write(json_encode(['error' => 'Something went wrong']));
	};
};

$app = new Slim\App($c);

$app->get('/', function ($request, $response, $args) {
	$response->write("Welcome to API =)");
	return $response;
});

// $app->get('/hello[/{name}]', function ($request, $response, $args) {
//     $response->write("Hello, " . $args['name']);
//     return $response;
// })->setArgument('name', 'World!');

$app->get('/(:controller(/:action(/:param)))',
  function($controller = 'home', $action = 'index', $param = null) {
	{
		echo $controller;
	}
);
/**
 * Step 4: Run the Slim application
 *
 * This method should be called last. This executes the Slim application
 * and returns the HTTP response to the HTTP client.
 */
$app->run();
