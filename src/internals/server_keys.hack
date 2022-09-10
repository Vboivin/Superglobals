namespace Superglobals\Internals;

enum ServerKeys: string as string {
    PHP_SELF = 'PHP_SELF';
    ARGV = 'argv';
    ARGC = 'argc';
    GATEWAY_INTERFACE = 'GATEWAY_INTERFACE';
    SERVER_ADDR = 'SERVER_ADDR';
    SERVER_NAME = 'SERVER_NAME';
    SERVER_SOFTWARE = 'SERVER_SOFTWARE';
    SERVER_PROTOCOL = 'SERVER_PROTOCOL';
    REQUEST_METHOD = 'REQUEST_METHOD';
    REQUEST_TIME = 'REQUEST_TIME';
    REQUEST_TIME_FLOAT = 'REQUEST_TIME_FLOAT';
    QUERY_STRING = 'QUERY_STRING';
    DOCUMENT_ROOT = 'DOCUMENT_ROOT';
    HTTP_ACCEPT = 'HTTP_ACCEPT';
    HTTP_ACCEPT_CHARSET = 'HTTP_ACCEPT_CHARSET';
    HTTP_ACCEPT_ENCODING = 'HTTP_ACCEPT_ENCODING';
    HTTP_ACCEPT_LANGUAGE = 'HTTP_ACCEPT_LANGUAGE';
    HTTP_CONNECTION = 'HTTP_CONNECTION';
    HTTP_HOST = 'HTTP_HOST';
    HTTP_REFERER = 'HTTP_REFERER';
    HTTP_USER_AGENT = 'HTTP_USER_AGENT';
    HTTPS = 'HTTPS';
    REMOTE_ADDR = 'REMOTE_ADDR';
    REMOTE_HOST = 'REMOTE_HOST';
    REMOTE_PORT = 'REMOTE_PORT';
    REMOTE_USER = 'REMOTE_USER';
    REDIRECT_REMOTE_USER = 'REDIRECT_REMOTE_USER';
    SCRIPT_FILENAME = 'SCRIPT_FILENAME';
    SERVER_ADMIN = 'SERVER_ADMIN';
    SERVER_PORT = 'SERVER_PORT';
    SERVER_SIGNATURE = 'SERVER_SIGNATURE';
    PATH_TRANSLATED = 'PATH_TRANSLATED';
    SCRIPT_NAME = 'SCRIPT_NAME';
    REQUEST_URI = 'REQUEST_URI';
    PHP_AUTH_DIGEST = 'PHP_AUTH_DIGEST';
    PHP_AUTH_USER = 'PHP_AUTH_USER';
    PHP_AUTH_PW = 'PHP_AUTH_PW';
    AUTH_TYPE = 'AUTH_TYPE';
    PATH_INFO = 'PATH_INFO';
    ORIG_PATH_INFO = 'ORIG_PATH_INFO';
    REQUEST_START_TIME = 'REQUEST_START_TIME';
    HTTP_CONTENT_LENGTH = 'HTTP_CONTENT_LENGTH';
    HTTP_CONTENT_TYPE = 'HTTP_CONTENT_TYPE';
    SCRIPT_URL = 'SCRIPT_URL';
    SCRIPT_URI = 'SCRIPT_URI';
    CONTENT_TYPE = 'CONTENT_TYPE';
    CONTENT_LENGTH = 'CONTENT_LENGTH';
    THREAD_TYPE = 'THREAD_TYPE';
}