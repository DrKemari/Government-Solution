#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85027 "Bank Rec Buffer Import"
{
    Direction = Import;
    // Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Bank Rec New"; "Bank Rec New")
            {
                XmlName = 'ImportEntries';
                fieldelement(pd; "Bank Rec New"."Entry No")
                {
                }
                fieldelement(doc; "Bank Rec New"."Document No")
                {
                }

                trigger OnBeforeInsertRecord()
                var
                    TXT001: label 'Bank Import for %1,is already imported';
                begin
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

