#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 69001 "Welfare Import"
{
    //Encoding = UTF8;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Welfare Lines";"Welfare Lines")
            {
                XmlName = 'WelfareLines';
                fieldelement(EmployeeNo;"Welfare Lines"."Employee No.")
                {
                }
                fieldelement(DateContributed;"Welfare Lines".Date)
                {
                }
                fieldelement(Amount;"Welfare Lines".Amount)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    "Welfare Lines"."Welfare Header No.":=WelfareNo;
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

    var
        WelfareNo: Code[30];
        WelfareCategory: Option;


    procedure GetVariables(HrWelfareHeader: Record "Hr Welfare Header")
    var
        Category: Option;
    begin
        WelfareNo:=HrWelfareHeader."Welfare No.";
    end;
}

