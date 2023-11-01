#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50026 "pageextension50026" extends "Job Card" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Job Card"(Page 88)".

    layout
    {
        modify("No.")
        {

            //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".

            Caption = 'Project Number';
        }
        modify(Description)
        {
            Caption = 'Project Descrption';
        }
        // modify("Bill-to Customer No.")
        // {
        //     ApplicationArea = Basic;
        //     Caption = 'Contractor Number';
        // }
        modify("Bill-to Name")
        {
            Caption = 'Contractor Name';

            //Unsupported feature: Property Insertion (Visible) on ""Bill-to Name"(Control 8)".

        }

        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Address"(Control 45)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Address 2"(Control 47)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to County"(Control 52)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Post Code"(Control 55)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to City"(Control 49)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Country/Region Code"(Control 43)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Contact"(Control 51)".

        modify("Person Responsible")
        {
            Caption = 'Investigator';

            //Unsupported feature: Property Insertion (Visible) on ""Person Responsible"(Control 6)".

        }
        modify("Project Manager")
        {
            Caption = 'Project Manager';
        }
        modify(JobTaskLines)
        {
            Caption = 'Project Activities';
        }
        // modify("Bill-to Customer No.")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to Customer No."(Control 32)".


        //Unsupported feature: Property Deletion (Importance) on ""Bill-to Customer No."(Control 32)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Bill-to Customer No."(Control 32)".

        // modify("Bill-to Contact No.")
        // {
        //     Visible = false;
        // }
        addafter("Bill-to Customer No.")
        {
            // field("Bill-to Contact No.";"Bill-to Contact No.")
            // {
            //     ApplicationArea = Jobs;
            //     Caption = 'Contractor Contacts';
            //     ToolTip = 'Specifies the number of the contact person at the customer''s billing address.';
            //     Visible = true;
            // }
        }
        addafter("Bill-to Name")
        {
            field("Road Classes"; Rec."Grant Type")
            {
                ApplicationArea = Basic;
                Caption = 'Road Class';
                Visible = false;
            }
            field("Road Length(KM)"; Rec."Road Length(KM)")
            {
                ApplicationArea = Basic;
                Caption = 'Road Length(KM)';
                Visible = false;
            }
            field("Funding Source"; Rec."Funding Source")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Last Date Modified")
        {
            field("Opportunity Reference"; Rec."Opportunity Reference")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Fund Opportunity Name"; Rec."Fund Opportunity Name")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
            }
            field("Grant Amount"; Rec."Grant Amount")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
            }
            field(exchequer; Rec.exchequer)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            group("Project Details")
            {
                Visible = false;
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                    Caption = 'Road';
                    Visible = false;
                }
                field("Research Project Area"; Rec."Research Project Area")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Researcher Code"; Rec."Researcher Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        moveafter("Bill-to Contact";"Project Manager")
    }
    actions
    {
        modify("Copy Job Tasks &to...")
        {
            Caption = 'Copy Project Activities &to...';

            //Unsupported feature: Property Modification (Name) on ""Copy Job Tasks &to..."(Action 27)".

        }
        addafter("&Dimensions")
        {
            action("Project Funding Sources")
            {
                ApplicationArea = Basic;
                Image = MapSetup;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Funding Source List";
            }
            action("Initate Procurement Process")
            {
                ApplicationArea = Basic;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Funding Source List";
            }
            action("Project Funding Line")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Funding Line";
                RunPageLink = "Project No"=field("No.");
            }
        }
        addafter("&Statistics")
        {
            action("Generate Payment Certificate")
            {
                ApplicationArea = Basic;
                Image = CalculateConsumption;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Report "Customer - List";
            }
        }
        addafter(History)
        {
            group("Task Lines")
            {
                action("Populate Task Lines")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        ProjectTemplates.Reset;
                        ProjectTemplates.SetRange(Blocked,false);
                        ProjectTemplates.SetFilter("Project  Task No.",'<>%1','');
                        if ProjectTemplates.Find('-') then begin
                          repeat
                            JobTaskLines.Reset;
                            JobTaskLines.SetRange("Job No.", Rec."No.");
                            JobTaskLines.SetRange("Job Task No.",ProjectTemplates."Project  Task No.");
                            if not JobTaskLines.FindSet then begin

                                JobTaskLines.Init;
                                JobTaskLines."Job No.":= Rec."No.";
                                JobTaskLines."Job Task No.":=ProjectTemplates."Project  Task No.";
                                JobTaskLines.Description:=ProjectTemplates."Project Description";
                                JobTaskLines.Insert(true);
                            end;
                          until ProjectTemplates.Next=0;
                        end;
                        Message('Job Task Lines loaded successfully');
                    end;
                }
            }
        }
    }

    var
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;

    var
        JobTaskLines: Record "Job Task";
        ProjectTemplates: Record "Project Templates";


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetNoFieldVisible;
        IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*

        //Ushindi
        CALCFIELDS("Project Budget","Actual Project Costs","PO Commitments","PRN Commitments","Store Requisition Commitments","Imprest Application Commitment");
        TotalBudgetCommitments:="PO Commitments"+"PRN Commitments"+"Store Requisition Commitments"+"Imprest Application Commitment";
        AvailableFunds:="Project Budget"-"Actual Project Costs"-TotalBudgetCommitments;
        //Ushindi

        SetNoFieldVisible;
        IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
        */
    //end;
}

#pragma implicitwith restore

