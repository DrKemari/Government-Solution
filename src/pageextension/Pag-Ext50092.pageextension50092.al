#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50092 "pageextension50092" extends "Employee Card" 
{
    layout
    {
        modify("No.")
        {
            Caption = 'Personal No.';
        }

        //Unsupported feature: Property Modification (SourceExpr) on ""Grounds for Term. Code"(Control 58)".


        //Unsupported feature: Property Modification (Name) on ""Grounds for Term. Code"(Control 58)".

        modify(Control13)
        {
            Visible = false;
        }
        // modify(Payments)
        // {
        //     Visible = false;
        // }
        addafter(Gender)
        {
            field(Balance; Rec.Balance)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Phone No.2")
        {
            field(Disabled; Rec.Disabled)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Company E-Mail")
        {
            field("User Signature"; Rec."User Signature")
            {
                ApplicationArea = Basic;
                Caption = 'Signature';
            }
        }
        addafter("Last Date Modified")
        {
            field(HOD; Rec.HOD)
            {
                ApplicationArea = Basic;
            }
            field(HODIR; Rec.HODIR)
            {
                ApplicationArea = Basic;
            }
            field(Supervisor; Rec.Supervisor)
            {
                ApplicationArea = Basic;
            }
        }
        addfirst("Address & Contact")
        {
            group(Control1367)
            {
            }
        }
        addafter("Salespers./Purch. Code")
        {
            field("Research Center"; Rec."Research Center")
            {
                ApplicationArea = Basic;
            }
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Birth Date")
        {
            field(Age; Rec.Age)
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
        addafter(Personal)
        {
            // group(Payments)
            // {
            //     Caption = 'Payments';
            // }
        }
        addafter("Bank Branch No.")
        {
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("&Confidential Information")
        {
            action("Attendance Clocking Entries")
            {
                ApplicationArea = Basic;
                Image = Entries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Clocking Entries";
                RunPageLink = "Employee No"=field("No.");
            }
        }
        addafter(PayEmployee)
        {
            action("Create Customer Imprest A/C")
            {
                ApplicationArea = Basic;
                Enabled = ShowCust;
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    if Rec.CreateCustomer then
                      Message(Text000,'Imprest A/C')
                    else
                      Message(Text001,'Imprest A/C');
                end;
            }
            action("Create Resource A/C")
            {
                ApplicationArea = Basic;
                Enabled = ShowResource;
                Image = Resource;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.CreateResource then
                      Message(Text000,'Resource')
                    else
                      Message(Text001,'Resource');
                end;
            }
            action("ICT Inventory Assigned")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "ICT Inventory List";
                RunPageLink = "Current Assigned Employee"=field("No.");
            }
        }
    }


    //Unsupported feature: Property Modification (Id) on "FormatAddress(Variable 1003)".

    //var
        //>>>> ORIGINAL VALUE:
        //FormatAddress : 1003;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //FormatAddress : 1553;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "IsCountyVisible(Variable 1002)".

    //var
        //>>>> ORIGINAL VALUE:
        //IsCountyVisible : 1002;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //IsCountyVisible : 1552;
        //Variable type has not been exported.

    var
        [InDataSet]
        ShowCust: Boolean;
        [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
}

#pragma implicitwith restore

