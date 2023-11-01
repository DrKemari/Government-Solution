report 80008 "Allocate Budget"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Allocate Budget.rdlc';

    dataset
    {
        dataitem("Strategic Int Planning Lines";"Strategic Int Planning Lines")
        {

            trigger OnAfterGetRecord()
            begin
                StrategicInitiative.Reset;
                StrategicInitiative.SetRange("Strategic Plan ID","Strategic Int Planning Lines"."Strategic Plan ID");
                StrategicInitiative.SetRange("Theme ID","Strategic Int Planning Lines"."Theme ID");
                StrategicInitiative.SetRange("Objective ID","Strategic Int Planning Lines"."Objective ID");
                StrategicInitiative.SetRange("Strategy ID","Strategic Int Planning Lines"."Strategy ID");
                StrategicInitiative.SetRange(Code,"Strategic Int Planning Lines".Code);
                if StrategicInitiative.Find('-') then begin
                   StrategicInitiative.CalcFields("CSP Planned Target");
                  if StrategicInitiative."CSP Planned Target"<>0 then begin
                    "Strategic Int Planning Lines"."Target Budget":=("Strategic Int Planning Lines"."Target Qty"/StrategicInitiative."CSP Planned Target")*StrategicInitiative."Collective Budget";
                     "Strategic Int Planning Lines".Modify;
                  end;
                end;
            end;
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

    labels
    {
    }

    var
        StrategicInitiative: Record "Strategic Initiative";
}

