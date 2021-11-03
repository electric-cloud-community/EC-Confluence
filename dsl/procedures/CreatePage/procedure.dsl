// This procedure.dsl was generated automatically
// DO NOT EDIT THIS BLOCK BELOW=== procedure_autogen starts ===
procedure 'Create Page', description: '''Create a Confluence wiki page''', {

    step 'Create Page', {
        description = ''
        command = new File(pluginDir, "dsl/procedures/CreatePage/steps/CreatePage.pl").text
        shell = 'ec-perl'
        shell = 'ec-perl'

        postProcessor = '''$[/myProject/perl/postpLoader]'''
    }

    formalOutputParameter 'PageUrl',
        description: '''URL link to the created page'''
// DO NOT EDIT THIS BLOCK ABOVE ^^^=== procedure_autogen ends, checksum: e0640ca7e9c7e732135af33d39e41267 ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}