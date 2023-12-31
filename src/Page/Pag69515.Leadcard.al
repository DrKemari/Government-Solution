#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69515 "Lead card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "General Equiries.";
    SourceTableView = where(Send = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Equiring As"; Rec."Calling As")
                {
                    ApplicationArea = Basic;
                    Caption = 'Equiring As';
                    OptionCaption = ',As Non Customer,As Others';
                    ToolTip = 'Specifies the value of the Equiring As field.';
                }
                field("<Equiring For>"; Rec."Calling For")
                {
                    ApplicationArea = Basic;
                    Caption = 'Log Type';
                    ToolTip = 'Specifies the value of the Log Type field.';
                }
                field("Contact Mode"; Rec."Contact Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Mode field.';
                }
                field("Physical Meeting Location"; Rec."Physical Meeting Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical Meeting Location field.';
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Lead Status field.';
                }
                field("Lead Region"; Rec."Lead Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Region field.';
                }
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Captured By field.';
                }
                field("Captured On"; Rec."Captured On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Captured On field.';
                }
            }
            group("Lead Details")
            {
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field(SurName; Rec.SurName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Surname';
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile No';
                    ToolTip = 'Specifies the value of the Mobile No field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Id Number"; Rec."Passport No")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID No';
                    ToolTip = 'Specifies the value of the ID No field.';
                }
            }
            group("Employment Info")
            {
                Caption = 'Employment Info';
                field(Control16; Rec."Employment Info")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Employment Info field.';
                    trigger OnValidate()
                    begin
                        if Rec."Employment Info" = Rec."employment info"::Employed then begin
                            EmployerCodeEditable := true;
                            DepartmentEditable := true;
                            TermsofEmploymentEditable := true;
                            ContractingEditable := false;
                            EmployedEditable := false;
                            OccupationEditable := false;
                            PositionHeldEditable := true;
                            EmploymentDateEditable := true;
                            EmployerAddressEditable := true;
                            NatureofBussEditable := false;
                            IndustryEditable := false;
                            BusinessNameEditable := false;
                            PhysicalBussLocationEditable := false;
                            YearOfCommenceEditable := false;



                        end else
                            if Rec."Employment Info" = Rec."employment info"::Contracting then begin
                                ContractingEditable := true;
                                EmployerCodeEditable := false;
                                DepartmentEditable := false;
                                TermsofEmploymentEditable := false;
                                OccupationEditable := false;
                                PositionHeldEditable := false;
                                EmploymentDateEditable := false;
                                EmployerAddressEditable := false;
                                NatureofBussEditable := false;
                                IndustryEditable := false;
                                BusinessNameEditable := false;
                                PhysicalBussLocationEditable := false;
                                YearOfCommenceEditable := false;
                            end else
                                if Rec."Employment Info" = Rec."employment info"::Others then begin
                                    OthersEditable := true;
                                    ContractingEditable := false;
                                    EmployerCodeEditable := false;
                                    DepartmentEditable := false;
                                    TermsofEmploymentEditable := false;
                                    OccupationEditable := false;
                                    PositionHeldEditable := false;
                                    EmploymentDateEditable := false;
                                    EmployerAddressEditable := false
                                end else
                                    if Rec."Employment Info" = Rec."employment info"::"Self-Employed" then begin
                                        OccupationEditable := true;
                                        EmployerCodeEditable := false;
                                        DepartmentEditable := false;
                                        TermsofEmploymentEditable := false;
                                        ContractingEditable := false;
                                        EmployedEditable := false;
                                        NatureofBussEditable := true;
                                        IndustryEditable := true;
                                        BusinessNameEditable := true;
                                        PhysicalBussLocationEditable := true;
                                        YearOfCommenceEditable := true;
                                        PositionHeldEditable := false;
                                        EmploymentDateEditable := false;
                                        EmployerAddressEditable := false

                                    end;




                        /*IF "Identification Document"="Identification Document"::"Nation ID Card" THEN BEGIN
                          PassportEditable:=FALSE;
                          IDNoEditable:=TRUE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Passport Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=FALSE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Aliens Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=TRUE;
                        END;*/

                    end;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    ApplicationArea = Basic;
                    Editable = EmployerCodeEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Employer Code field.';
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    ApplicationArea = Basic;
                    Editable = EmployedEditable;
                    ToolTip = 'Specifies the value of the Employer Name field.';
                }
                field("Employer Address"; Rec."Employer Address")
                {
                    ApplicationArea = Basic;
                    Editable = EmployerAddressEditable;
                    ToolTip = 'Specifies the value of the Employer Address field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Caption = 'WorkStation / Depot';
                    Editable = DepartmentEditable;
                    ToolTip = 'Specifies the value of the WorkStation / Depot field.';
                }
                field("Terms of Employment"; Rec."Terms of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = TermsofEmploymentEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Terms of Employment field.';
                }
                field("Date of Employment"; Rec."Date of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = EmploymentDateEditable;
                    ToolTip = 'Specifies the value of the Date of Employment field.';
                }
                field("Position Held"; Rec."Position Held")
                {
                    ApplicationArea = Basic;
                    Editable = PositionHeldEditable;
                    ToolTip = 'Specifies the value of the Position Held field.';
                }
                field("Expected Monthly Income"; Rec."Expected Monthly Income")
                {
                    ApplicationArea = Basic;
                    Editable = MonthlyIncomeEditable;
                    ToolTip = 'Specifies the value of the Expected Monthly Income field.';
                }
                field("Nature Of Business"; Rec."Nature Of Business")
                {
                    ApplicationArea = Basic;
                    Editable = NatureofBussEditable;
                    ToolTip = 'Specifies the value of the Nature Of Business field.';
                }
                field(Industry; Rec.Industry)
                {
                    ApplicationArea = Basic;
                    Editable = IndustryEditable;
                    ToolTip = 'Specifies the value of the Industry field.';
                }
                field("Business Name"; Rec."Business Name")
                {
                    ApplicationArea = Basic;
                    Editable = BusinessNameEditable;
                    ToolTip = 'Specifies the value of the Business Name field.';
                }
                field("Physical Business Location"; Rec."Physical Business Location")
                {
                    ApplicationArea = Basic;
                    Editable = PhysicalBussLocationEditable;
                    ToolTip = 'Specifies the value of the Physical Business Location field.';
                }
                field("Year of Commence"; Rec."Year of Commence")
                {
                    ApplicationArea = Basic;
                    Editable = YearOfCommenceEditable;
                    ToolTip = 'Specifies the value of the Year of Commence field.';
                }
                field(Occupation; Rec.Occupation)
                {
                    ApplicationArea = Basic;
                    Editable = OccupationEditable;
                    ToolTip = 'Specifies the value of the Occupation field.';
                }
                field("Others Details"; Rec."Others Details")
                {
                    ApplicationArea = Basic;
                    Editable = OthersEditable;
                    ToolTip = 'Specifies the value of the Others Details field.';
                }
            }
            group("Referee Details")
            {
                Caption = 'Referee Details';
                field("Referee Member No"; Rec."Referee Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Customer No field.';
                }
                field("Referee Name"; Rec."Referee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee Name field.';
                }
                field("Referee ID No"; Rec."Referee ID No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee ID No field.';
                }
                field("Referee Mobile Phone No"; Rec."Referee Mobile Phone No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee Mobile Phone No field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Detailed Member Page")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = New;
                ToolTip = 'Executes the Detailed Member Page action.';
            }
            action("Create ")
            {
                ApplicationArea = Basic;
                Caption = 'Create Lead';
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Create Lead action.';
                trigger OnAction()
                begin



                    //ERROR("Calling As");
                    //IF ("Calling As"="Calling As"::"As Non Member")OR ("Calling As"="Calling As"::"As Others") THEN BEGIN
                    ok := Confirm('Create a lead  for ' + Rec."First Name" + Rec.SurName + '.The lead will be allocated a new lead Number. Continue?');
                    if ok then begin
                        //Create Invest Account
                        if LeadSetup.Get then begin
                            LeadSetup.TestField(LeadSetup."Lead Nos");
                            LeadNo := NoSeriesMgt.GetNextNo(LeadSetup."Lead Nos", 0D, true);
                            if LeadNo <> '' then begin
                                LeadM.Init;
                                LeadM."No." := LeadNo;
                                LeadM."First Name" := Rec."First Name";
                                LeadM."Middle Name" := Rec.SurName;
                                LeadM.Surname := Rec."Last Name";
                                LeadM."member no" := Rec."Member No";
                                LeadM.Name := Rec."Member Name";
                                LeadM.Address := Rec.Address;
                                LeadM.City := Rec.City;
                                LeadM."Phone No." := Rec."Phone No";
                                LeadM."Company No." := Rec."Company No";
                                LeadM."Company Name" := Rec."Company Name";
                                LeadM.Name := Rec."First Name" + ' ' + Rec.SurName + ' ' + ' ' + Rec."Last Name";
                                LeadM.Type := Rec."Calling As";
                                LeadM."ID No" := Rec."ID No";
                                LeadM."Receive date" := Today;
                                LeadM."Receive Time" := Time;
                                LeadM."Received From" := UserId;
                                LeadM."Sent By" := UserId;
                                LeadM."Caller Reffered To" := Rec."Caller Reffered To";
                                LeadM.Description := Rec.Description;
                                LeadM.status := LeadM.Status::Opportunity;
                                LeadM."Employment Info" := Rec."Employment Info";
                                LeadM."Employer Code" := Rec."Employer Code";
                                LeadM."Employer Name" := Rec."Employer Name";
                                LeadM."Employer Address" := Rec."Employer Address";
                                LeadM."Employer Type" := Rec."Employer Type";
                                LeadM."Employment Terms" := Rec."Employment Terms";
                                LeadM."Business Name" := Rec."Business Name";
                                LeadM.Industry := Rec.Industry;
                                LeadM.Department := Rec.Department;
                                LeadM."Year of Commence" := Rec."Year of Commence";
                                LeadM."Position Held" := Rec."Position Held";
                                LeadM."Expected Monthly Income" := Rec."Expected Monthly Income";
                                LeadM."Date of Employment" := Rec."Date of Employment";
                                LeadM."Physical Business Location" := Rec."Physical Business Location";
                                LeadM."Others Details" := Rec."Others Details";
                                LeadM."Nature Of Business" := Rec."Nature Of Business";
                                LeadM."Referee Member No" := Rec."Referee Member No";
                                LeadM."Referee ID No" := Rec."Referee ID No";
                                LeadM."Referee Name" := Rec."Referee Name";
                                LeadM."Referee Mobile Phone No" := Rec."Referee Mobile Phone No";
                                LeadM."Lead Status" := LeadM."lead status"::"Converted to Opportunity";
                                LeadM.Insert(true);
                                //Send:=TRUE;
                                LeadM.Converted := true;
                                Rec.Modify;
                                Message('Opportunity successfully generated');
                            end;
                        end;
                    end;

                    //categories lead
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        AsEmployer := false;
        Asmember := false;
        AsNonmember := false;
        Asother := false;
        Ascase := false;
        if Rec."Calling As" = Rec."calling as"::"As Member" then begin
            Asmember := true;
            AsEmployer := true;
            Ascase := true;
        end;
        if Rec."Calling As" = Rec."calling as"::"As Non Member" then begin
            AsNonmember := true;
            Asother := true;
        end;
        if Rec."Calling As" = Rec."calling as"::"As Employer" then begin
            AsEmployer := true;
            Asother := true;
            Ascase := true;
        end;

        if Rec."Employment Info" = Rec."employment info"::Employed then begin
            EmployerCodeEditable := true;
            DepartmentEditable := true;
            TermsofEmploymentEditable := true;
            ContractingEditable := false;
            EmployedEditable := false;
            OccupationEditable := false;
            PositionHeldEditable := true;
            EmploymentDateEditable := true;
            EmployerAddressEditable := true;
            NatureofBussEditable := false;
            IndustryEditable := false;
            BusinessNameEditable := false;
            PhysicalBussLocationEditable := false;
            YearOfCommenceEditable := false;



        end else
            if Rec."Employment Info" = Rec."employment info"::Contracting then begin
                ContractingEditable := true;
                EmployerCodeEditable := false;
                DepartmentEditable := false;
                TermsofEmploymentEditable := false;
                OccupationEditable := false;
                PositionHeldEditable := false;
                EmploymentDateEditable := false;
                EmployerAddressEditable := false;
                NatureofBussEditable := false;
                IndustryEditable := false;
                BusinessNameEditable := false;
                PhysicalBussLocationEditable := false;
                YearOfCommenceEditable := false;
            end else
                if Rec."Employment Info" = Rec."employment info"::Others then begin
                    OthersEditable := true;
                    ContractingEditable := false;
                    EmployerCodeEditable := false;
                    DepartmentEditable := false;
                    TermsofEmploymentEditable := false;
                    OccupationEditable := false;
                    PositionHeldEditable := false;
                    EmploymentDateEditable := false;
                    EmployerAddressEditable := false
                end else
                    if Rec."Employment Info" = Rec."employment info"::"Self-Employed" then begin
                        OccupationEditable := true;
                        EmployerCodeEditable := false;
                        DepartmentEditable := false;
                        TermsofEmploymentEditable := false;
                        ContractingEditable := false;
                        EmployedEditable := false;
                        NatureofBussEditable := true;
                        IndustryEditable := true;
                        BusinessNameEditable := true;
                        PhysicalBussLocationEditable := true;
                        YearOfCommenceEditable := true;
                        PositionHeldEditable := false;
                        EmploymentDateEditable := false;
                        EmployerAddressEditable := false

                    end;
    end;

    trigger OnOpenPage()
    begin
        AsEmployer := false;
        Asmember := false;
        AsNonmember := false;
        Asother := false;
        Ascase := false;

        if Rec."Calling As" = Rec."calling as"::"As Non Member" then begin
            AsNonmember := true;
            Asother := true;
        end;


        if Rec."Employment Info" = Rec."employment info"::Employed then begin
            EmployerCodeEditable := true;
            DepartmentEditable := true;
            TermsofEmploymentEditable := true;
            ContractingEditable := false;
            EmployedEditable := false;
            OccupationEditable := false;
            PositionHeldEditable := true;
            EmploymentDateEditable := true;
            EmployerAddressEditable := true;
            NatureofBussEditable := false;
            IndustryEditable := false;
            BusinessNameEditable := false;
            PhysicalBussLocationEditable := false;
            YearOfCommenceEditable := false;



        end else
            if Rec."Employment Info" = Rec."employment info"::Contracting then begin
                ContractingEditable := true;
                EmployerCodeEditable := false;
                DepartmentEditable := false;
                TermsofEmploymentEditable := false;
                OccupationEditable := false;
                PositionHeldEditable := false;
                EmploymentDateEditable := false;
                EmployerAddressEditable := false;
                NatureofBussEditable := false;
                IndustryEditable := false;
                BusinessNameEditable := false;
                PhysicalBussLocationEditable := false;
                YearOfCommenceEditable := false;
            end else
                if Rec."Employment Info" = Rec."employment info"::Others then begin
                    OthersEditable := true;
                    ContractingEditable := false;
                    EmployerCodeEditable := false;
                    DepartmentEditable := false;
                    TermsofEmploymentEditable := false;
                    OccupationEditable := false;
                    PositionHeldEditable := false;
                    EmploymentDateEditable := false;
                    EmployerAddressEditable := false
                end else
                    if Rec."Employment Info" = Rec."employment info"::"Self-Employed" then begin
                        OccupationEditable := true;
                        EmployerCodeEditable := false;
                        DepartmentEditable := false;
                        TermsofEmploymentEditable := false;
                        ContractingEditable := false;
                        EmployedEditable := false;
                        NatureofBussEditable := true;
                        IndustryEditable := true;
                        BusinessNameEditable := true;
                        PhysicalBussLocationEditable := true;
                        YearOfCommenceEditable := true;
                        PositionHeldEditable := false;
                        EmploymentDateEditable := false;
                        EmployerAddressEditable := false

                    end;
    end;

    var
        Cust: Record Customer;
        CustCare: Record "General Equiries.";
        CQuery: Record "General Equiries.";
        LeadM: Record "Lead Management";
        entry: Integer;
        vend: Record Vendor;
        CASEM: Record "Cases Management";
        AsEmployer: Boolean;
        Asmember: Boolean;
        AsNonmember: Boolean;
        Asother: Boolean;
        Ascase: Boolean;
        Leadacc: Record "Lead Management";
        LeadAcc2: Record "Lead Management";
        ok: Boolean;
        LeadSetup: Record "Crm General Setup.";
        LeadNo: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CaseNO: Code[20];
        CaseSetup: Record "Crm General Setup.";
        sure: Boolean;
        Yah: Boolean;
        EmploymentInfoEditable: Boolean;
        EmployedEditable: Boolean;
        ContractingEditable: Boolean;
        NatureofBussEditable: Boolean;
        IndustryEditable: Boolean;
        BusinessNameEditable: Boolean;
        PhysicalBussLocationEditable: Boolean;
        YearOfCommenceEditable: Boolean;
        PositionHeldEditable: Boolean;
        EmploymentDateEditable: Boolean;
        EmployerAddressEditable: Boolean;
        EmployerCodeEditable: Boolean;
        DepartmentEditable: Boolean;
        TermsofEmploymentEditable: Boolean;
        OccupationEditable: Boolean;
        OthersEditable: Boolean;
        MonthlyIncomeEditable: Boolean;
}

#pragma implicitwith restore

