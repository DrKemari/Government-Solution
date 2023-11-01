#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85061 "Exemption Entries"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Exemption Entries";
    SourceTableView = where(Deleted = filter(false));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Remove; Rec.Remove)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remove field.';
                }
                field("Stud. Cust No."; Rec."Stud. Cust No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Stud. Cust No. field.';
                }
                field("Stud. Reg. No"; Rec."Stud. Reg. No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Stud. Reg. No field.';
                }
                field("Exemption Voucher No."; Rec."Exemption Voucher No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Exemption Voucher No. field.';
                }
                field("Course Id"; Rec."Course Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination  Id';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination  Id field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount LCY field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Remove Exemption")
            {
                ApplicationArea = Basic;
                Image = DeleteQtyToHandle;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Remove Exemption action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    TXT001: label 'Delete exemption %1 for %2';
                    ExemptionEntries: Record "Exemption Entries";
                begin
                    if Confirm(TXT001, true, Rec."No.", Rec."Stud. Reg. No") = true then begin
                        ExemptionEntries.Reset;
                        ExemptionEntries.SetRange("Stud. Reg. No", Rec."Stud. Reg. No");
                        ExemptionEntries.SetRange(Remove, true);
                        if ExemptionEntries.FindSet then begin
                            repeat
                                Examination.ExemptionDelete(ExemptionEntries);
                            until ExemptionEntries.Next = 0;
                        end

                    end
                end;
            }
        }
    }
}

#pragma implicitwith restore

