#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51327 "Account Creation Card"
{
    PageType = Card;
    SourceTable = Contact;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
            group(Control33)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    Editable = true;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the name of the contact. If the contact is a person, you can click the field to see the Name Details window.';

                    trigger OnAssistEdit()
                    var
                        Contact: Record Contact;
                    begin
                    end;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the type of contact, either company or person.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Tax Registration (PIN) No.';
                    Importance = Additional;
                    ToolTip = 'Specifies the contact''s VAT registration number. This field is valid for companies only.';
                    Visible = false;

                    trigger OnDrillDown()
                    var
                        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                    begin
                        VATRegistrationLogMgt.AssistEditContactVATReg(Rec);
                    end;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    Caption = 'Proposed Insitution Name';
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the company. If the contact is a person, Specifies the name of the company for which this contact works. This field is not editable.';
                    Visible = false;

                    trigger OnAssistEdit()
                    begin
                        Rec.LookupCompany;
                    end;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Rejection field.';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                group(Control25)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = true;
                        ToolTip = 'Specifies the contact''s address.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = true;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        Importance = Promoted;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        ToolTip = 'Specifies the city where the contact is located.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        ToolTip = 'Specifies the country/region of the address.';
                    }
                    label(ShowMap)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        ShowCaption = false;
                        Style = StrongAccent;
                        StyleExpr = true;
                        ToolTip = 'Specifies the contact''s address on your preferred map website.';

                        //                        // Rec.trigger OnDrillDown()
                        //     begin
                        //         CurrPage.Update(true);
                        //         Rec.DisplayMap;
                        //     end;
                        // }
                    }
                }
                group(ContactDetails)
                {
                    Caption = 'Contact';
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        ToolTip = 'Specifies the contact''s phone number.';
                    }
                    field("Mobile Phone No."; Rec."Mobile Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = true;
                        ToolTip = 'Specifies the contact''s mobile telephone number.';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = true;
                        ExtendedDatatype = EMail;
                        Importance = Promoted;
                        ToolTip = 'Specifies the email address of the contact.';
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Control6; "Contact Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
            }
            part(Control5; "Contact Statistics FactBox")
            {
                ApplicationArea = RelationshipMgmt;
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter");
            }
            systempart(Control4; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control3; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Create as")
            {
                Caption = 'Create as';
                Image = CustomerContact;
                action(CreateCustomer)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create the  customer.';

                    trigger OnAction()
                    begin
                        //CreateInstitution(Rec."No.");
                    end;
                }
                action(CreatePortalUser)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create User Account';
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create User Account';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //TESTFIELD(Type,Type::Student);
                        //PortalUserManagement.CreatePeerReviewerAccount(Rec);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                }
                // trigger OnAction()
                //    var
                //       SMTP: Codeunit "SMTP Mail"Codeunit "Accreditation-Quality Audit"Codeunit ""
            }
        }
    }
}