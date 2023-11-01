#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85228 "Processed Student Details"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Student Processing Header";
    SourceTableView = where(Posted=filter(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process';
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                }
                field("Application Invoice"; Rec."Application Invoice")
                {
                    ApplicationArea = Basic;
                }
                field("Application Receipt"; Rec."Application Receipt")
                {
                    ApplicationArea = Basic;
                }
                field("Booking Receipt No."; Rec."Booking Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Receipt No."; Rec."Renewal Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field("Exemption Receipt 6No."; Rec."Exemption Receipt 6No.")
                {
                    ApplicationArea = Basic;
                }
                field("Exemption Invoice No."; Rec."Exemption Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Application Amount"; Rec."Application Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Booking Amount"; Rec."Booking Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Exemption Amount"; Rec."Exemption Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Registration Receipt")
            {
                ApplicationArea = Basic;
                Image = print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85049,true,false,Rec);
                end;
            }
            action("Exemption Receipt")
            {
                ApplicationArea = Basic;
                Image = print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85048,true,false,Rec);
                end;
            }
            action("Booking Receipt")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85047,true,false,Rec);
                end;
            }
            action("Renewal Receipt")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85050,true,false,Rec);
                end;
            }
        }
    }
}

#pragma implicitwith restore

