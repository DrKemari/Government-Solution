#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50009 "Update HR Application Jobs"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Training Plan Header";"Training Plan Header")
            {
                AutoSave = true;
                AutoUpdate = true;
                XmlName = 'UpdateHRApplicationJobs';
                // fieldelement(AppNo;"Update HR Application Jobs".No)
                // {
                // }
                // fieldelement(Description;"Update HR Application Jobs".Description)
                // {
                // }
                // fieldelement(Specialization;"Update HR Application Jobs"."Start Date")
                // {
                // }
                // fieldelement(JobId;"Update HR Application Jobs"."End Date")
                // {
                // }
                // fieldelement(code;"Update HR Application Jobs".Global)
                // {
                // }

                trigger OnAfterInsertRecord()
                begin
                    //"Purchase Header".VALIDATE("Purchase Header"."Shortcut Dimension 1 Code","Purchase Header"."Location Code");
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

