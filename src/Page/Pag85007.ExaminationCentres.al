#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85007 "Examination Centres"
{
    AdditionalSearchTerms = 'warehouse setup,inventory setup';
    ApplicationArea = Basic;
    Caption = 'Examination Centres';
    CardPageID = "Exam Center Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Navigate';
    SourceTable = "Examination Centres";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies a location code for the warehouse or distribution center where your items are handled and stored before being sold.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name or address of the location.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the location address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the location.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Computer Based Friendly"; Rec."Computer Based Friendly")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computer Based Friendly field.';
                }
                field("Disability Friendly"; Rec."Disability Friendly")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Friendly field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Courses Offered")
            {
                ApplicationArea = Basic;
                Image = Continue;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Center Examinations";
                RunPageLink = "Centre Code" = field(Code);
                ToolTip = 'Executes the Courses Offered action.';
            }
            action("Student Booked")
            {
                ApplicationArea = Basic;
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Exam Booking Entries";
                RunPageLink = "Exam Center" = field(Code);
                ToolTip = 'Executes the Student Booked action.';
            }
            action("Booking Summary")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Booking Summary action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(85020, true, false, Rec);
                end;
            }
            action("Send Centre Summary")
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Centre Summary action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(85142, true, false, Rec);
                end;
            }
        }
    }
}

#pragma implicitwith restore

