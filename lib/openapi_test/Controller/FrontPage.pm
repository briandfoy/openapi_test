package openapi_test::Controller::Frontpage;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub text ( $c ) {
	$c->app->log->info( "In frontpage#text" );
	$c->render( text => "Front page" );
	}

1;
