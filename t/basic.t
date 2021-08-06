use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('openapi_test');

diag( 'Mojolicious::Plugin::OpenAPI ' . Mojolicious::Plugin::OpenAPI->VERSION );
diag( 'JSON::Validator::Schema::OpenAPIv3 ' . JSON::Validator::Schema::OpenAPIv3->VERSION );

$t->get_ok('/search')->status_is(400, 'Missing q is bad request' );
$t->get_ok('/search?q=abc')->status_is(200);

$t->get_ok('/search?q=abc')->status_is(200);

$t->get_ok('/search?q=abc&flags=123')->status_is(200, 'Single flags succeeds' );
$t->get_ok('/search?q=abc&flags=123&flags=xyz')->status_is(200, 'Multiple flags succeeds' );

done_testing();
