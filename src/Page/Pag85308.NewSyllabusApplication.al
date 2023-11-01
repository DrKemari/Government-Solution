#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85308 "New Syllabus Application"
{
    PageType = Card;
    SourceTable = "Syllabus Review";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Plan No."; Rec."Plan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan No. field.';
                }
                field("Plan Item"; Rec."Plan Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Item field.';
                }
                field("Syllabus Type Name"; Rec."Syllabus Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus Type Name field.';
                }
                field(Justification; Rec.Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Domain Code"; Rec."Domain Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Domain Code field.';
                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Domain Name field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Person Responsible field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                action("Initiate the Review Process")
                {
                    ApplicationArea = Basic;
                    Image = InsertBalanceAccount;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Initiate the Review Process action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Create a project for this review?';
                        Examination: Codeunit Examination;
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        if Confirm(TXT001) = true then begin
                            Examination.CreateSyllabusJob(Rec);
                        end
                    end;
                }
                action("Source Types")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Application Source Types";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the Source Types action.';
                }
            }
        }
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Application No.", Rec."Application No.");
                    Report.Run(85305, true, false, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.New := true;
    end;
}

#pragma implicitwith restore

