// This procedure.dsl was generated automatically
// DO NOT EDIT THIS BLOCK === procedure_autogen starts ===
procedure 'Create Page', description: '''Create a Confluence wiki page''', {

    step 'Create Page', {
        description = ''
        command = new File(pluginDir, "dsl/procedures/CreatePage/steps/CreatePage.pl").text
        shell = 'ec-perl'
        shell = 'ec-perl'

        postProcessor = '''$[/myProject/perl/postpLoader]'''
    }

    formalOutputParameter 'PageUrl',
        description: 'URL link to the created page'
// DO NOT EDIT THIS BLOCK === procedure_autogen ends, checksum: 02e5efdb3d51861f79be974e17126b87 ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}