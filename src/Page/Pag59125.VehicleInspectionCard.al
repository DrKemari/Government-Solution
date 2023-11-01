#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59125 "Vehicle Inspection Card"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Vehicle Inspection";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle CC"; Rec."Vehicle CC")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Inspection Details")
            {
                field("Last Inspection Date"; Rec."Last Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Inspection No."; Rec."Last Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Status"; Rec."Inspection Status")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Has Speed Governor"; Rec."Has Speed Governor")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Center"; Rec."Inspection Center")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark as Passed Inspection")
            {
                ApplicationArea = Basic;
                Image = CheckDuplicates;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as passed?',true) then begin
                        Rec.TestField(Posted,false);
                        Rec."Inspection Status" := Rec."inspection status"::Passed;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify;
                    end;
                end;
            }
            action("Mark as Lost Inspection")
            {
                ApplicationArea = Basic;
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as failed?',true) then begin
                        Rec.TestField(Posted,false);
                        Rec."Inspection Status" := Rec."inspection status"::Failed;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }
}

#pragma implicitwith restore

