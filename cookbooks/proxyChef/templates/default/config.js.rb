var config = {};

// The PORT used by
<% if ENV['BIZ_ECOSYS_PORT'] != Nil %>
config.port = <%= ENV['BIZ_ECOSYS_PORT'] %>;
<% else %>
config.port = '80';
<% end %>

// Set this var to undefined if you dont want the server to listen on HTTPS
config.https = {
    enabled: false,
    certFile: 'cert/cert.crt',
    keyFile: 'cert/key.key',
    caFile: 'cert/ca.crt',
    port: 443
};

// Express configuration
config.proxyPrefix = '/proxy';
config.portalPrefix = '';
config.logInPath = '/login';
config.logOutPath = '/logOut';
config.sessionSecret = 'keyboard cat';

// OAuth2 configuration
config.oauth2 = {
    'server': 'https://account.lab.fiware.org',
<% if ENV[OAUTH2_CLIENT_ID] != Nil %>
    'clientID': '<%= ENV[OAUTH2_CLIENT_ID] %>',
<% else %>
'clientID': '--client-id--',
<% end %>
<% if ENV[OAUTH2_CLIENT_SECRET] != Nil %>
    'clientSecret': '<%= ENV[OAUTH2_CLIENT_SECRET] %>',
<% else %>
'clientSecret': '--client-secret--',
<% end %>
<% if ENV[BIZ_ECOSYS_HOST] != Nil && ENV[BIZ_ECOSYS_HOST] != Nil %>
'callbackURL': 'http://<%= ENV[BIZ_ECOSYS_HOST] %>:<%= ENV[BIZ_ECOSYS_HOST]  %>',
<% else %>
'callbackURL': '--callback-url--',
<% end %>    
'roles': {
        'admin': 'provider',
        'customer': 'customer',
        'seller': 'seller'
    }
}

// Customer Role Required to buy items
config.customerRoleRequired = false;

// MongoDB
config.mongoDb = {
    server: 'localhost',
    port: 27017,
    user: '',
    password: '',
    db: 'belp'
};

// TMForum APIs final paths
<% if ENV['API_HOST'] != Nil %>
config.appHost = <%= ENV['API_HOST']; %>
<% else %>
config.appHost = '127.0.0.1';
<% end %>


// Configure endpoints
<% if ENV['GLASSFISH_PORT'] != Nil %>
<%  %>
config.endpoints = {
    'catalog': {
        'path': 'DSProductCatalog',
        'port': '<%= ENV['GLASSFISH_PORT'] %>'
    },
    'ordering': {
         'path': 'DSProductOrdering',
         'port': '<%= ENV['GLASSFISH_PORT'] %>'
    },
    'inventory': {
        'path': 'DSProductInventory',
        'port': '<%= ENV['GLASSFISH_PORT'] %>'
    },
    'charging': {
        'path': 'charging',
        'port': '8006'
    },
    'rss': {
        'path': 'DSRevenueSharing',
        'port': '<%= ENV['GLASSFISH_PORT'] %>'
    },
    'party': {
        'path': 'DSPartyManagement',
        'port': '<%= ENV['GLASSFISH_PORT'] %>'
    },
    'billing':{
        'path': 'DSBillingManagement',
        'port': '<%= ENV['GLASSFISH_PORT'] %>'
    },
    'customer': {
        'path': 'DSCustomerManagement',
        'port': '<%= ENV['GLASSFISH_PORT'] %>'
    },
    'usage':  {
        'path': 'DSUsageManagement',
        'port': '<%= ENV['GLASSFISH_PORT'] %>'
    }
};

// Percentage of the generated revenues that belongs to the system
config.revenueModel = 30;

// Billing Account owner role
config.billingAccountOwnerRole = 'bill receiver';

// Use true if the app server listens in https
config.appSsl = false;

// list of paths that will not check authentication/authorization
// example: ['/public/*', '/static/css/']
config.publicPaths = [];

config.magicKey = undefined;

config.usageChartURL = 'https://mashup.lab.fiware.org/fdelavega/UsageChart?mode=embedded&theme=wirecloud.fiwarelabtheme';

module.exports = config;
