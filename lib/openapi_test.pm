package openapi_test;
use Mojo::Base 'Mojolicious', -signatures;

use Mojolicious::Plugin::OpenAPI 4;

sub startup ($app) {
	$app->routes->get( '/' )->to( "frontpage#text" );

	$app->plugin( OpenAPI => {
		spec      => $app->static->file( 'openapi.yaml' )->path,
		log_level => 'debug',
		} );

	$app->log->debug(
		'Mojolicious::Plugin::OpenAPI ' . Mojolicious::Plugin::OpenAPI->VERSION
		);
}

1;
