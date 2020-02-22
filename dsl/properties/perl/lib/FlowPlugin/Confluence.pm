package FlowPlugin::Confluence;
use JSON;
use strict;
use warnings;
use base qw/FlowPDF/;
use FlowPDF::Log;
use FlowPDF::Helpers qw/bailOut/;

# Feel free to use new libraries here, e.g. use File::Temp;

# Service function that is being used to set some metadata for a plugin.
sub pluginInfo {
    return {
        pluginName          => '@PLUGIN_KEY@',
        pluginVersion       => '@PLUGIN_VERSION@',
        configFields        => ['config'],
        configLocations     => ['ec_plugin_cfgs'],
        defaultConfigValues => {}
    };
}

# Auto-generated method for the procedure Create Page/Create Page
# Add your code into this method and it will be called when step runs
# Parameter: config
# Parameter: SpaceKey
# Parameter: Title
# Parameter: Ancestors
# Parameter: Content

sub createPage {
    my ($pluginObject) = @_;

    my $context = $pluginObject->getContext();
    my $params = $context->getRuntimeParameters();

    my $ECConfluenceRESTClient = $pluginObject->getECConfluenceRESTClient;
    # If you have changed your parameters in the procedure declaration, add/remove them here
    my %restParams = (
        'SpaceKey' => $params->{'SpaceKey'},
        'Title' => $params->{'Title'},
        'Ancestors' => $params->{'Ancestors'},
        'Content' => $params->{'Content'},
    );
    my $response = $ECConfluenceRESTClient->createPage(%restParams);
    logInfo("Got response from the server: ", $response);

    my $stepResult = $context->newStepResult;
    $stepResult->setOutputParameter(PageUrl => $response->{'_links'}->{'base'} . $response->{'_links'}->{'webui'});
    
    $stepResult->apply();
}

# This method is used to access auto-generated REST client.
sub getECConfluenceRESTClient {
    my ($self) = @_;

    my $context = $self->getContext();
    my $config = $context->getRuntimeParameters();
    require FlowPlugin::ECConfluenceRESTClient;
    my $client = FlowPlugin::ECConfluenceRESTClient->createFromConfig($config);
    return $client;
}
## === step ends ===
# Please do not remove the marker above, it is used to place new procedures into this file.


1;