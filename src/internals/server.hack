namespace Superglobals\Internals;
use namespace HH\Lib\C;

/**
 * Implementation with typings of the $_SERVER php superglobal.
 *
 * $_SERVER is an array containing information such as headers, paths, and
 * script locations. The entries in this array are created by the web server.
 * There is no guarantee that every web server will provide any of these;
 * servers may omit some, or provide others not listed here. That said, a large
 * number of these variables are accounted for in the » CGI/1.1 specification,
 * so you should be able to expect those.
 *
 * https://www.php.net/manual/en/reserved.variables.server.php
 */
final class _SERVER extends Superglobal {
    /**
     * The filename of the currently executing script, relative to the document
     * root. For instance, $_SERVER['PHP_SELF'] in a script at the address
     * http://example.com/foo/bar.php would be /foo/bar.php. The __FILE__
     * constant contains the full path and filename of the current
     * (i.e. included) file. If PHP is running as a command-line processor
     * this variable contains the script name.
     */
    static public ?string $PHP_SELF;

    /**
     * Array of arguments passed to the script. When the script is run on the
     * command line, this gives C-style access to the command line parameters.
     * When called via the GET method, this will contain the query string.
     */
    static public ?vec<mixed> $argv;

    /**
     * Contains the number of command line parameters passed to the script
     * (if run on the command line).
     */
    static public ?int $argc;

    /**
     * What revision of the CGI specification the server is using;
     * e.g. 'CGI/1.1'.
     */
    static public ?string $GATEWAY_INTERFACE;

    /**
     * The IP address of the server under which the current script is executing.
     */
    static public ?string $SERVER_ADDR;

    /**
     * The name of the server host under which the current script is executing.
     * If the script is running on a virtual host, this will be the value
     * defined for that virtual host.
     */
    static public ?string $SERVER_NAME;

    /**
     * Server identification string, given in the headers when responding to
     * requests.
     */
    static public ?string $SERVER_SOFTWARE;

    /**
     * Name and revision of the information protocol via which the page was
     * requested;
     * e.g. 'HTTP/1.0';
     */
    static public ?string $SERVER_PROTOCOL;

    /**
     * Which request method was used to access the page; e.g. 'GET', 'HEAD',
     * 'POST', 'PUT'.
     */
    static public ?string $REQUEST_METHOD;

    /**
     * The timestamp of the start of the request.
     */
    static public ?int $REQUEST_TIME;

    /**
     * The timestamp of the start of the request, with microsecond precision.
     */
    static public ?float $REQUEST_TIME_FLOAT;

    /**
     * The query string, if any, via which the page was accessed.
     */
    static public ?string $QUERY_STRING;

    /**
     * The document root directory under which the current script is executing,
     * as defined in the server's configuration file.
     */
    static public ?string $DOCUMENT_ROOT;

    /**
     * Contents of the Accept: header from the current request, if there is one.
     */
    static public ?string $HTTP_ACCEPT;

    /**
     * Contents of the Accept-Charset: header from the current request,
     * if there is one. Example: 'iso-8859-1,*,utf-8'.
     */
    static public ?string $HTTP_ACCEPT_CHARSET;

    /**
     * Contents of the Accept-Encoding: header from the current request,
     * if there is one. Example: 'gzip'.
     */
    static public ?string $HTTP_ACCEPT_ENCODING;

    /**
     * Contents of the Accept-Language: header from the current request,
     * if there is one. Example: 'en'.
     */
    static public ?string $HTTP_ACCEPT_LANGUAGE;

    /**
     * Contents of the Connection: header from the current request,
     * if there is one. Example: 'Keep-Alive'.
     */
    static public ?string $HTTP_CONNECTION;

    /**
     * Contents of the Host: header from the current request, if there is one.
     */
    static public ?string $HTTP_HOST;

    /**
     * The address of the page (if any) which referred the user agent to the
     * current page. This is set by the user agent. Not all user agents will set
     * this, and some provide the ability to modify HTTP_REFERER as a feature.
     * In short, it cannot really be trusted.
     */
    static public ?string $HTTP_REFERER;

    /**
     * Contents of the User-Agent: header from the current request, if there is
     * one. This is a string denoting the user agent being which is accessing
     * the page.
     * A typical example is: Mozilla/4.5 [en] (X11; U; Linux 2.2.9 i586).
     * Among other things, you can use this value with get_browser() to tailor
     * your page's output to the capabilities of the user agent.
     */
    static public ?string $HTTP_USER_AGENT;

    /**
     * Set to a non-empty value if the script was queried through the
     * HTTPS protocol.
     */
    static public ?string $HTTPS;

    /**
     * The IP address from which the user is viewing the current page.
     */
    static public ?string $REMOTE_ADDR;

    /**
     * The Host name from which the user is viewing the current page.
     * The reverse dns lookup is based on the REMOTE_ADDR of the user.
     */
    static public ?string $REMOTE_HOST;

    /**
     * The port being used on the user's machine to communicate with
     * the web server.
     */
    static public ?int $REMOTE_PORT;

    /**
     * The authenticated user.
     */
    static public ?string $REMOTE_USER;

    /**
     * The authenticated user if the request is internally redirected.
     */
    static public ?string $REDIRECT_REMOTE_USER;

    /**
     * The absolute pathname of the currently executing script.
     */
    static public ?string $SCRIPT_FILENAME;

    /**
     * The value given to the SERVER_ADMIN (for Apache) directive in the web
     * server configuration file. If the script is running on a virtual host,
     * this will be the value defined for that virtual host.
     */
    static public ?string $SERVER_ADMIN;

    /**
     * The port on the server machine being used by the web server for
     * communication. For default setups, this will be '80'; using SSL, for
     * instance, will change this to whatever your defined secure HTTP port is.
     */
    static public ?int $SERVER_PORT;

    /**
     * String containing the server version and virtual host name which are
     * added to server-generated pages, if enabled.
     */
    static public ?string $SERVER_SIGNATURE;

    /**
     * Filesystem- (not document root-) based path to the current script,
     * after the server has done any virtual-to-real mapping.
     */
    static public ?string $PATH_TRANSLATED;

    /**
     * Contains the current script's path. This is useful for pages which need
     * to point to themselves. The __FILE__ constant contains the full path and
     * filename of the current (i.e. included) file.
     */
    static public ?string $SCRIPT_NAME;

    /**
     * The URI which was given in order to access this page;
     * for instance, '/index.html'.
     */
    static public ?string $REQUEST_URI;

    /**
     * When doing Digest HTTP authentication this variable is set to the
     * 'Authorization' header sent by the client (which you should then use to
     * make the appropriate validation).
     */
    static public ?string $PHP_AUTH_DIGEST;

    /**
     * When doing HTTP authentication this variable is set to the username
     * provided by the user.
     */
    static public ?string $PHP_AUTH_USER;

    /**
     * When doing HTTP authentication this variable is set to the password
     * provided by the user.
     */
    static public ?string $PHP_AUTH_PW;

    /**
     * When doing HTTP authentication this variable is set to the authentication
     * type.
     */
    static public ?string $AUTH_TYPE;

    /**
     * Contains any client-provided pathname information trailing the actual
     * script filename but preceding the query string, if available. For
     * instance, if the current script was accessed via the URL
     * http://www.example.com/php/path_info.php/some/stuff?foo=bar,
     * then $_SERVER['PATH_INFO'] would contain /some/stuff.
     */
    static public ?string $PATH_INFO;

    /**
     * Original version of 'PATH_INFO' before processed by PHP.
     */
    static public ?string $ORIG_PATH_INFO;

    static public ?int $REQUEST_START_TIME;
    static public ?string $HTTP_CONTENT_LENGTH;
    static public ?string $HTTP_CONTENT_TYPE;
    static public ?string $SCRIPT_URL;
    static public ?string $SCRIPT_URI;
    static public ?string $CONTENT_TYPE;
    static public ?string $CONTENT_LENGTH;
    static public ?string $THREAD_TYPE;

    public function __construct()[]: void {
        throw new SuperglobalException(
            get_error_mesage_constructor(GlobalEnum::SERVER),
        );
    }

    <<__Override>>
    public static function _INIT()[globals, rx_local]: void {
        $server = \HH\global_get(GlobalEnum::SERVER);
        $server as dict<_, _>;
        if (!$server) {
            return;
        }
        $clazz = new \ReflectionClass(self::class);
        foreach (ServerKeys::getValues() as $_ => $key) {
            if (C\contains_key($server, $key)) {
                $clazz->setStaticPropertyValue($key, $server[$key]);
            }
        }
    }

    /**
     * Escape hatch available while using Globals->SERVER.
     * The static properties defined on this class do not encompass
     * all the possible options provided by the superglobal $_SERVER.
     * As such, we provide the user with this method to access unknown
     * or custom variables possibly accessible on $_SERVER.
     *
     * You can also use HH\global_get('_SERVER') as an alternative.
     */
    public static function _UNSAFE()[globals]: mixed {
        return \HH\global_get(GlobalEnum::SERVER);
    }
}
