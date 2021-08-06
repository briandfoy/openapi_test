package openapi_test::Controller::Echo {
	use Mojo::Base 'Mojolicious::Controller', -signatures;

	sub text ( $c ) {
		$c = $c->openapi->valid_input // return;
		$c->app->log->info( "In text" );

		my $hash = { foo => 'bar' };

		$c->render( json => $hash );
		}

	}

1;
