#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50014 "CuePortal"
{

    // trigger OnRun()
    // begin
    //     //MESSAGE(dataClerkEmailRequest('16','obadiah123!'));
    //     // MESSAGE(getInvitationNumber('CUST_19-20:049'));
    //     //MESSAGE(approvalStatusDataCollection('16','obadiah123!'));
    //     //MESSAGE(ValidateDataCollectionDatasets('CUST_19-20:049','INV128','16','Admin@2030'));
    //     //MESSAGE(fnResetPassword('korir400@gmail.com','FFFE2DA7','Admin@2030','Admin@2030') );
    //     // MESSAGE(FngetUniversityDomain('CUST_19-20:071'));
    //     //MESSAGE(FnGenerateProgrammeFeedbackVoucher('CUST_19-20:338','CUST_19-20:049'));
    //     //MESSAGE(ProgramAccreditationAlert(1,'CUST_19-20:007','PROG_009'));
    //     //MESSAGE(applyForAccreditation('KCA','636 RUIRU','00232','margaretmumbi16@gmail.com','FULL','connect.com','89989760','kenya','07234784','1','123456789'));
    //     //MESSAGE(createICTAccessory('APP0076','001','HGDHGXCA',0,3));
    //     //MESSAGE(AccreditationApplication('full','KCA','public','','',''));
    //     //MESSAGE(creatAccreditationResponce('001','Nor','APP0069'));
    //     //MESSAGE(SelfEvaluationResponce('APP0074','003','0019',1,''));
    //     //MESSAGE(Printdsummeryscore('AM_2019-20:024'));
    //     //MESSAGE(ConfirmPaymentsInstitution('APP0069',TRUE,'REF01'));
    //     //MESSAGE(CreatAccreditationSubQResponce('003','RDFTYGHJ','APP0076','001'))
    //     //MESSAGE(SelfEvalutionApplication('APP0073'));
    //     //MESSAGE(ConfirmAccreditationPayment('APP0077',TRUE,'Ref003'));
    //     //MESSAGE(PrintdetailedReport('SE0001'));
    //     Message(fnGenerateDeclaration());
    // end;

    // var
    //     objCustomer: Record Customer;
    //     objAccredOnboardingTable: Record "Accreditation Verdict Setup";
    //     CashMgt: Record "Cash Management Setup";
    //     univernumber1: Text;
    //     filelocation: Text;
    //     univernumber2: Text;
    //     TempFile: File;
    //     ToFile: Text;
    //     NewStream: InStream;
    //     Email: Text;
    //     Body: Text;
    //     SMTP: Codeunit "Email Message";
    //     Email1: Text[250];
    //     Email3: Text[250];
    //     Email2: Text[250];
    //     Email4: Text;
    //     Email5: Text;
    //     Sendername: Text;
    //     "applicationno.": Text;
    //     InstitutionOnbording: Record "Ins. Accreditation Table";
    //     Amount: Decimal;
    //     No: Code[50];
    //     ProgramAccreditation: Record "Acc Fee Schedules";
    //     AccreditationSetup: Record "Accreditation Type Series";
    //     FILESPATH: label '';
    //     SalesSetup: Record "Sales & Receivables Setup";
    //     InstNo: Code[50];
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     objVendor: Record Vendor;
    //     MemoWriter: OutStream;
    //     Applicationnumber1: Code[100];
    //     Applicationnumber2: Code[100];
    //     FileName: Code[100];
    //     HODAccreditation: Text;
    //     DCSAccreditation: Text;
    //     FinanceOfficer: Text;
    //     DataOfficer: Text;
    //     UniversityEmail: Text;
    //     ProgrammesCounter: Integer;
    //     universityusers: Record UniversityUsers;
    //     accreditatinApplication: Record "Accreditation Application";
    //     InstitutionNo: Integer;
    //     SMTPMailSetup: Record "Email Account";
    //     "code": Code[10];
    //     FILESPATH2: label 'C:\inetpub\wwwroot\Accreditation\downloads\certificate\';
    //     FILESPATH3: label 'C:\inetpub\wwwroot\Accreditation\downloads\scores\';
    //     FILESPATH4: label 'C:\inetpub\wwwroot\Accreditation\downloads\detailedReport\';
    //     FILESPATH5: label 'C:\inetpub\wwwroot\Accreditation\downloads\ApplicationForm\';
    //     appNo: Code[50];
    //     FILESPATH6: label 'C:\inetpub\wwwroot\Accreditation\downloads\SummeryScore\';
    //     ExaminationSetup: Record "Examination Setup";
    //     DocLog: Record "Document E-mail Log";
    //     Counter: Integer;
    //     FILESPATH7: label 'C:\inetpub\wwwroot\Accreditation\downloads\AccreditationReport\';
    //     FILESPATH8: label 'C:\inetpub\wwwroot\Accreditation\downloads\Declaration\';

    // procedure getApplicationNumber(usercode: Code[50]) applicationnumber: Text
    // var
    //     InstitutionOnbording: Record "Ins. Accreditation Table";
    // begin
    //     InstitutionOnbording.Reset;
    //     InstitutionOnbording.SetRange("Institution No.", usercode);
    //     if InstitutionOnbording.FindLast then begin
    //         applicationnumber := InstitutionOnbording."Accreditation No.";
    //     end;
    // end;

    // procedure ConfirmPayment(UniversityCode: Code[50])
    // var
    //     GenSetUp: Record "Accreditation Setups";
    //     SalesInv: Record "Sales Header";
    //     SalesLine: Record "Sales Line";
    //     FeeSchedule: Record "Acc Fee Schedules";
    // begin
    //     InstitutionOnbording.TestField("KRA Pin");
    //     InstitutionOnbording.TestField(Paid, false);
    //     InstitutionOnbording.TestField("Proposal Document", true);
    //     InstitutionOnbording.TestField("Application Letter", true);
    //     InstitutionOnbording.TestField("Payment Document", true);
    //     InstitutionOnbording.TestField("KRA Copy", true);
    //     GenSetUp.Get();
    //     Amount := 0;
    //     FeeSchedule.Reset;
    //     FeeSchedule.SetRange(Blocked, false);
    //     FeeSchedule.SetRange(Description, InstitutionOnbording."Accreditation Type");
    //     if FeeSchedule.FindSet then begin
    //         Amount := FeeSchedule.Amount;
    //         No := UniversityCode;
    //     end;
    //     SalesInv.Reset;
    //     SalesInv.SetRange("Bill-to Customer No.", No);
    //     SalesInv.SetRange("External Document No.", InstitutionOnbording."Accreditation No.");
    //     if SalesInv.Find('-') then begin
    //         Error('The Sales invoice has already been created.');

    //     end else begin

    //         SalesInv.Init;
    //         SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //         SalesInv."No." := '';
    //         SalesInv.Validate(SalesInv."Sell-to Customer No.", No);
    //         SalesInv."Document Date" := Today;
    //         SalesInv."Order Date" := Today;
    //         SalesInv."Posting Date" := Today;
    //         SalesInv."External Document No." := InstitutionOnbording."Accreditation No.";
    //         SalesInv.Type := SalesInv.Type::Normal;
    //         SalesInv."Prepayment %" := 100;//enforce prepayment`
    //         SalesInv.Insert(true);

    //         SalesLine.Init;
    //         SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //         SalesLine."Document No." := SalesInv."No.";
    //         SalesLine.Type := SalesLine.Type::Resource;
    //         SalesLine.Validate(SalesLine."No.", GenSetUp.Resource);
    //         SalesLine.Validate(SalesLine.Quantity, 1);
    //         SalesLine.Validate(SalesLine."Unit Price", Amount);
    //         SalesLine.Insert(true);
    //         InstitutionOnbording."Invoice No." := SalesInv."No.";
    //         InstitutionOnbording.Invoiced := true;
    //         InstitutionOnbording.Modify;
    //         /*
    //         MESSAGE('Invoice %1 has been created Successfully',SalesInv."No.");
    //             IF CONFIRM('Are you sure you want to post the Sales Invoice?',FALSE) THEN BEGIN
    //                 SalesPostYesNo.RUN(SalesInv);
    //                 "Sales Invoice No.":=SalesInv."No.";
    //                 Invoiced:=TRUE;
    //                 MODIFY;

    //             END
    //         */
    //     end;

    // end;

    // procedure Approve(category: Text; userId: Text; password: Text; "action": Boolean): Boolean
    // begin
    // end;

    // procedure applyForAccreditation(proposedName: Text; postaddress: Text; postcode: Text; email: Text; accreditationType: Text; institutionwebsite: Text; kraPin: Code[100]; tConstituency: Code[100]; phonenumber: Code[100]; userCode: Code[20]; userPassword: Text) status: Text
    // var
    //     InsitutionOnboardingTable: Record "Ins. Accreditation Table";
    //     UniversityCode: Code[50];
    // begin
    //     UniversityCode := getInstitutionNumber(userCode, userPassword);
    //     InsitutionOnboardingTable.Reset;
    //     if InsitutionOnboardingTable."Accreditation No." = '' then begin
    //         InsitutionOnboardingTable.Init;
    //         InsitutionOnboardingTable."Institution No." := UniversityCode;
    //         InsitutionOnboardingTable.Validate("Institution No.");
    //         InsitutionOnboardingTable."Institution Campus" := proposedName;
    //         InsitutionOnboardingTable."Application Date" := Today;
    //         InsitutionOnboardingTable."Submission Date" := Today;

    //         InsitutionOnboardingTable.Address := postaddress;
    //         InsitutionOnboardingTable."Post Code" := postcode;
    //         InsitutionOnboardingTable.Validate("Post Code");
    //         InsitutionOnboardingTable.Email := email;
    //         InsitutionOnboardingTable."Accreditation Code" := accreditationType;
    //         InsitutionOnboardingTable.Contact := institutionwebsite;
    //         InsitutionOnboardingTable."KRA Pin" := kraPin;
    //         InsitutionOnboardingTable."Phone No." := phonenumber;
    //         InsitutionOnboardingTable.Constituency := tConstituency;

    //         InsitutionOnboardingTable.Status := InsitutionOnboardingTable.Status::Open;
    //         /* InsitutionOnboardingTable.County:= county;
    //           InsitutionOnboardingTable.Contact:= institutionwebsite;
    //          InsitutionOnboardingTable.VALIDATE("Post Code");
    //            InsitutionOnboardingTable."Accreditation Code":= accreditationType;
    //         InsitutionOnboardingTable.Contact:= institutionwebsite;
    //          InsitutionOnboardingTable."Phone No.":= phonenumber;
    //          InsitutionOnboardingTable.Sponsor:= sponsor;
    //          InsitutionOnboardingTable.County:= county;
    //         InsitutionOnboardingTable.Constituency:= constituency;
    //          InsitutionOnboardingTable."KRA Pin":= krapin;
    //         IF NOT newUser THEN BEGIN
    //          InsitutionOnboardingTable."Insitution No.":= userCode;
    //          InsitutionOnboardingTable.VALIDATE("Insitution No.");
    //          END;
    //         InsitutionOnboardingTable."Institution No.":= UniversityCode;

    //         InsitutionOnboardingTable."Proposed Location":= proposedLocation;
    //         InsitutionOnboardingTable.Address:= postAddress;
    //         InsitutionOnboardingTable.Email:= emailAddress;
    //         InsitutionOnboardingTable."Post Code":= postCode;
    //         InsitutionOnboardingTable.VALIDATE("Post Code");
    //         InsitutionOnboardingTable."Institutional Website":= institutionWebsite;
    //         nsitutionOnboardingTable."Phone No.":= phoneNumber;
    //         InsitutionOnboardingTable.Sponsor:= sponsor;
    //         InsitutionOnboardingTable.County:= county;
    //         InsitutionOnboardingTable.VALIDATE("County Code");
    //         InsitutionOnboardingTable.Constituency:= constituency;
    //         InsitutionOnboardingTable.VALIDATE("Constituency Code");
    //         InsitutionOnboardingTable."KRA Pin":= kraPin;
    //         InsitutionOnboardingTable."Application Letter":=TRUE;
    //         InsitutionOnboardingTable."Proposal Document":=TRUE;
    //         InsitutionOnboardingTable."KRA Copy":=TRUE;
    //         InsitutionOnboardingTable."Payment Document":=TRUE;
    //         */
    //         if InsitutionOnboardingTable.Insert(true) then begin
    //             status := 'success*The request was successfully captured.*' + InsitutionOnboardingTable."Accreditation No.";
    //             /*SMTPMail.Create('kasneb','margaretmumbi@dynasoft.co.ke', 'margaretmumbi16@gmail.com','New Accreditation Application','A new accreditation application received.... (customize message)', TRUE);
    //           SMTPMail.Send();*/
    //         end;
    //     end;

    // end;

    // procedure deleteSponsors(entryNo: Integer; user: Code[20]; password: Text): Boolean
    // var
    //     UniversityCode: Code[50];
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[10];
    // begin
    //     /*Sponsors.RESET;
    //     Sponsors.SETRANGE(Code, entryNo);
    //     IF Sponsors.FINDSET THEN BEGIN
    //       IF Sponsors.DELETE(TRUE) THEN
    //         EXIT(TRUE)
    //       END;
    //     EXIT(FALSE);*/

    // end;

    // procedure deleteDepartments(entryNo: Integer; user: Code[20]; password: Text): Boolean
    // var
    //     UniversityCode: Code[50];
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin

    //     /*Departments.RESET;
    //     Departments.SETRANGE("Department Code", entryNo);
    //     IF Departments.FINDSET THEN BEGIN
    //       IF Departments.DELETE(TRUE) THEN
    //         EXIT(TRUE)
    //       END;*/

    //     exit(false);

    // end;

    // procedure deleteSchools(entryNo: Integer; user: Code[20]; password: Text): Boolean
    // var
    //     UniversityCode: Code[50];
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin

    //     /*SchoolFaculties.RESET;
    //     SchoolFaculties.SETRANGE("School Code", entryNo);
    //     IF SchoolFaculties.FINDSET THEN BEGIN
    //       IF SchoolFaculties.DELETE(TRUE) THEN
    //         EXIT(TRUE)
    //       END;
        
    //     EXIT(FALSE);*/

    // end;

    // procedure deleteAffiliations(entryNo: Integer; user: Code[20]; password: Text): Boolean
    // var
    //     datacollectionDatasetID: Code[50];
    // begin

    //     /*Affiliations.RESET;
    //     Affiliations.SETRANGE(Code, entryNo);
    //     IF Affiliations.FINDSET THEN BEGIN
    //       IF Affiliations.DELETE(TRUE) THEN
    //         EXIT(TRUE)
    //       END;
        
    //     EXIT(FALSE);
    //     */

    // end;

    // procedure deleteChancellors(entryNo: Integer; user: Code[20]; password: Text): Boolean
    // var
    //     UniversityCode: Code[50];
    //     NoticeNumber: Code[50];
    // begin
    //     /*
    //     Chancellors.RESET;
    //     Chancellors.SETRANGE(Code, entryNo);
    //     IF Chancellors.FINDSET THEN BEGIN
    //       IF Chancellors.DELETE(TRUE) THEN
    //         EXIT(TRUE)
    //       END;
    //     EXIT(FALSE);
    //     */

    // end;

    // procedure getInstitutionNumber(userCode: Code[20]; password: Text): Code[50]
    // var
    //     userCodeInt: Integer;
    // begin

    //     universityusers.Reset;
    //     Evaluate(userCodeInt, userCode);
    //     universityusers.SetRange("Entry No", userCodeInt);
    //     universityusers.SetRange("Password Value", password);
    //     if universityusers.FindSet then begin
    //         exit(universityusers.UniversityCode);
    //     end else begin
    //         Error('Wrong user credentials');
    //     end;
    //     exit('');
    // end;

    // procedure deletekeymilestone(milestoneCode: Integer; userCode: Text; userPassword: Text) status: Text
    // var
    //     universityCode: Code[50];
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*
    //     universityCode:= getInstitutionNumber(userCode ,userPassword);
    //     keymilestone.RESET;
    //     keymilestone.SETRANGE("University Code",universityCode);
    //     keymilestone.SETRANGE(Code,milestoneCode);
    //     IF keymilestone.FINDSET THEN BEGIN
    //       IF keymilestone.DELETE(TRUE) THEN BEGIN
    //         status:='success*The University Key Milestone Details was successfully deleted';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*The  University Key Milestone Details could not be found.Kindly ensure that the Data collection period is still open';
    //      END;
    //      */

    // end;

    // procedure editChancellors(universitycode: Code[30]; name: Text; qualifications: Code[100]; appointmentdate: Date; nationality: Code[30]; userCode: Text; userPassword: Text) status: Text
    // var
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*NoticeNumber:=getInvitationNumber(universitycode);
    //     Chancellor.RESET;
    //     Chancellor.SETRANGE("University Code", universitycode);
    //     IF Chancellor.FINDSET THEN BEGIN
    //     Chancellor."University Code":= universitycode;
    //     Chancellor.Name:= name;
    //     Chancellor."Highest Academic Qualification":= qualifications;
    //     Chancellor."Date of Appointment":= appointmentdate;
    //     Chancellor.Nationality:= nationality;
    //     Chancellor."Invitation No":=NoticeNumber;
    //     Chancellor."Submitted On":=CURRENTDATETIME;
    //     IF Chancellor.MODIFY(TRUE) THEN BEGIN
    //       status:='success*The Chancellor was successfully updated';
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*The Chancellor could not be found';
    //         END;*/

    // end;

    // procedure editAffiliations(universitycode: Code[30]; affilicationcode: Integer; name: Text; affiliationcountry: Code[50]; organisationname: Text; userCode: Text; userPassword: Text) status: Text
    // var
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*NoticeNumber:=getInvitationNumber(universitycode);
    //     UniversityAffiliation.RESET;
    //     UniversityAffiliation.SETRANGE("University Code", universitycode);
    //     UniversityAffiliation.SETRANGE(Code, affilicationcode);
    //     IF UniversityAffiliation.FINDSET THEN BEGIN
    //     UniversityAffiliation."Affiliation description":= name;
    //     UniversityAffiliation.Country:= affiliationcountry;
    //     UniversityAffiliation."Organisation Name":=organisationname;
    //     UniversityAffiliation."Invitation No":=NoticeNumber;
    //     UniversityAffiliation."Submitted On":=CURRENTDATETIME;
    //     IF UniversityAffiliation.MODIFY(TRUE) THEN BEGIN
    //       status:='success*The University Affiliations Details was successfully updated';
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*The University Affiliations Details could not be found';
    //         END;
    //         */

    // end;

    // procedure editSponsor(universitycode: Code[30]; name: Text; userCode: Text; userPassword: Text) status: Text
    // var
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*
    //     UniversitySponsors.RESET;
    //     UniversitySponsors.SETRANGE("University Code", universitycode);
    //     IF UniversitySponsors.FINDSET THEN BEGIN
    //     UniversitySponsors."University Code":= universitycode;
    //     UniversitySponsors."Sponsor Name":= name;
    //     IF UniversitySponsors.MODIFY(TRUE) THEN BEGIN
    //       status:='success*The Sponsor was successfully updated';
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*The Sponsor could not be found';
    //         END;*/

    // end;

    // procedure editKeyMilestones(universitycode: Code[30]; "code": Integer; year: Text; milestone: BigText; userCode: Text; userPassword: Text) status: Text
    // var
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*
    //     UniversityMilestones.RESET;
    //     UniversityMilestones.SETRANGE("University Code", universitycode);
    //     IF UniversityMilestones.FINDSET THEN BEGIN
    //     UniversityMilestones."Milestone Year":= year;
    //       UniversityMilestones.Code:= code;
    //     //UniversityMilestones."Milestone Description":= milestone;
    //     UniversityMilestones."Milestone Description".CREATEOUTSTREAM(MemoWriter);
    //     milestone.WRITE(MemoWriter);
    //     IF UniversityMilestones.MODIFY(TRUE) THEN BEGIN
    //       status:='success*The Key Milestones was successfully updated';
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*The Key Milestones could not be found';
    //         END;
    //         */

    // end;

    // procedure editSchool(universitycode: Code[30]; schoolcode: Integer; name: Text; userCode: Text; userPassword: Text) status: Text
    // var
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*UniversitySchools.RESET;
    //     UniversitySchools.SETRANGE("University Code", universitycode);
    //     UniversitySchools.SETRANGE("School Code", schoolcode);
    //     IF UniversitySchools.FINDSET THEN BEGIN
    //     UniversitySchools."University Code":= universitycode;
    //     UniversitySchools."School Name":= name;
    //     IF UniversitySchools.MODIFY(TRUE) THEN BEGIN
    //       status:='success*The University School/Faculty or Institute was successfully updated';
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*The University School/Faculty or Institute could not be found';
    //         END;*/

    // end;

    // procedure editDepartment(universitycode: Code[30]; departmentcode: Integer; school: Text; department: Text; userCode: Text; userPassword: Text) status: Text
    // var
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*
    //     UniversityDepartment.RESET;
    //     UniversityDepartment.SETRANGE("University Code", universitycode);
    //     UniversityDepartment.SETRANGE("Department Code", departmentcode);
    //     IF UniversityDepartment.FINDSET THEN BEGIN
    //     UniversityDepartment."University Code":= universitycode;
    //     UniversityDepartment."School Code":= school;
    //     UniversityDepartment."Department Name":= department;
    //     IF UniversityDepartment.MODIFY(TRUE) THEN BEGIN
    //       status:='success*The Department was successfully updated';
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*The Department could not be found';
    //         END;
    //         */

    // end;

    // procedure editGeneralDetails(universityCode: Code[50]; statusCategory: Integer; institutionSponsor: Integer; institutionEmailAddress: Text; institutionPhoneNumber: Code[50]; institutionPostAddress: Code[50]; institutionPostCode: Code[50]; mainCampusCounty: Code[50]; mainCampusConstituency: Code[50]; mainCampusTown: Text) status: Text
    // var
    //     Customer: Record Customer;
    // begin
    //     /*status:='danger*The general details could not be updated';
    //     Customer.RESET;
    //     Customer.SETRANGE("No.", universityCode);
    //     IF Customer.FINDSET THEN BEGIN
    //       //universityCode : Code[50]; : Integer; : Integer; : Text; : Code[50]; : Code[50]; : Code[50]; : Code[50]; : Code[50]; : Text
    //       Customer."E-Mail":= institutionEmailAddress;
    //       Customer."Phone No.":= institutionPhoneNumber;
    //       Customer.Address:= institutionPostAddress;
    //       Customer."Post Code":= institutionPostCode;
    //       Customer.VALIDATE("Post Code");
    //       IF Customer.MODIFY(TRUE) THEN BEGIN
    //         UniversityProfile.RESET;
    //         UniversityProfile.SETRANGE("University Code", universityCode);
    //         IF UniversityProfile.FINDSET THEN BEGIN
    //             UniversityProfile."Status/Category":= statusCategory;
    //             UniversityProfile."Sponsor of Institution":= institutionSponsor;
    //             UniversityProfile."County of Main Campus":= mainCampusCounty;
    //             UniversityProfile."Constituency of Main Campus":= mainCampusConstituency;
    //             UniversityProfile."Town of Main Campus":= mainCampusTown;
    //             IF UniversityProfile.MODIFY(TRUE) THEN BEGIN
    //               status:='success*The general details were successfully updated';
    //               END;
    //           END ELSE BEGIN
    //             UniversityProfile.INIT;
    //             UniversityProfile."University Code":= universityCode;
    //              UniversityProfile."Status/Category":= statusCategory;
    //             UniversityProfile."Sponsor of Institution":= institutionSponsor;
    //             UniversityProfile."County of Main Campus":= mainCampusCounty;
    //             UniversityProfile."Constituency of Main Campus":= mainCampusConstituency;
    //             UniversityProfile."Town of Main Campus":= mainCampusTown;
    //             IF UniversityProfile.INSERT(TRUE) THEN BEGIN
    //               status:='success*The general details were successfully updated';
    //               END;
    //             END;
    //         END ;
    //       END ELSE BEGIN
    //         status:='danger*The given university does not exist'+universityCode;
    //         END;*/

    // end;

    // procedure addMissionDetails(universityCode: Code[50]; mission: BigText; vission: BigText; aims: BigText) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    //     MemoWriter: OutStream;
    // begin
    //     /*status:='danger*The University Mission & Vission details could not be updated';
    //    Customer.RESET;
    //    Customer.SETRANGE("No.", universityCode);
    //    IF Customer.FINDSET THEN BEGIN
    //    UniversityProfile.RESET;
    //    UniversityProfile.SETRANGE("University Code", universityCode);
    //    IF UniversityProfile.FINDSET THEN BEGIN
    //       UniversityProfile."University Mission".CREATEOUTSTREAM(MemoWriter);
    //       mission.WRITE(MemoWriter);
    //       UniversityProfile."University Vission".CREATEOUTSTREAM(MemoWriter);
    //       vission.WRITE(MemoWriter);
    //       UniversityProfile.Aims.CREATEOUTSTREAM(MemoWriter);
    //       aims.WRITE(MemoWriter);
    //        //UniversityProfile."University Mission":= mission;
    //        //UniversityProfile."University Vission":= vission;
    //        //UniversityProfile.Aims:= aims;
    //        IF UniversityProfile.MODIFY(TRUE) THEN BEGIN
    //          status:='success*The University Mission & Vission details were successfully updated';
    //          END;
    //      END ELSE BEGIN
    //        UniversityProfile.INIT;
    //        UniversityProfile."University Mission".CREATEOUTSTREAM(MemoWriter);
    //       mission.WRITE(MemoWriter);
    //       UniversityProfile."University Vission".CREATEOUTSTREAM(MemoWriter);
    //       vission.WRITE(MemoWriter);
    //       UniversityProfile.Aims.CREATEOUTSTREAM(MemoWriter);
    //       aims.WRITE(MemoWriter);
    //       UniversityProfile."University Code":= universityCode;
    //        //UniversityProfile."University Mission":= mission;
    //        //UniversityProfile."University Vission":= vission;
    //       /// UniversityProfile.Aims:= aims;
    //        IF UniversityProfile.INSERT(TRUE) THEN BEGIN
    //          status:='success*The University Mission & Vission details were successfully Submitted';
    //          END;
    //        END;

    //     END ELSE BEGIN
    //        status:='danger*The given university does not exist'+universityCode;
    //        END;*/

    // end;

    // procedure addPhilosophy(universityCode: Code[50]; philosophicalbasis: BigText) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    //     MemoWriter: OutStream;
    // begin

    //     /*status:='danger*The University philosophical basis details could not be updated';
    //     //NoticeNumber:=getInvitationNumber(universityCode);
    //    Customer.RESET;
    //    Customer.SETRANGE("No.", universityCode);
    //    IF Customer.FINDSET THEN BEGIN
    //    UniversityProfile.RESET;
    //    UniversityProfile.SETRANGE("University Code", universityCode);
    //    IF UniversityProfile.FINDSET THEN BEGIN
    //       //UniversityProfile."Philosophical Basis":= philosophicalbasis;
    //       UniversityProfile."Philosophical Basis".CREATEOUTSTREAM(MemoWriter);
    //        philosophicalbasis.WRITE(MemoWriter);
    //        UniversityProfile."Invitation Number":= NoticeNumber;
    //        UniversityProfile."Submitted On":=CURRENTDATETIME;
    //        IF UniversityProfile.MODIFY(TRUE) THEN BEGIN
    //          status:='success*The University philosophical basis details were successfully updated';
    //          END;
    //      END ELSE BEGIN
    //        UniversityProfile.INIT;
    //        UniversityProfile."University Code":= universityCode;
    //       // UniversityProfile."Philosophical Basis":= philosophicalbasis;
    //        UniversityProfile."Philosophical Basis".CREATEOUTSTREAM(MemoWriter);
    //        philosophicalbasis.WRITE(MemoWriter);
    //        UniversityProfile."Invitation Number":= NoticeNumber;
    //        UniversityProfile."Submitted On":=CURRENTDATETIME;
    //        IF UniversityProfile.INSERT(TRUE) THEN BEGIN
    //          status:='success*The University philosophical basis details were successfully updated';
    //          END;

    //        END;

    //     END ELSE BEGIN
    //        status:='danger*The given university does not exist'+universityCode;
    //        END;*/


    // end;

    // procedure addMilestone(universityCode: Code[50]; milestoneyear: Text; milestonedescription: BigText) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    //     MemoWriter: OutStream;
    // begin
    //     //NoticeNumber:=getInvitationNumber(universityCode);
    //     /*UniversityProfile.INIT;
    //     UniversityProfile."University Code":= universityCode;
    //     //UniversityProfile."Milestone Description":= milestonedescription;
    //     UniversityProfile."Milestone Description".CREATEOUTSTREAM(MemoWriter);
    //     milestonedescription.WRITE(MemoWriter);
    //     UniversityProfile."Milestone Year":= milestoneyear;
    //     UniversityProfile."Invitation No":=NoticeNumber;
    //     UniversityProfile."Submitted On":=CURRENTDATETIME;
    //     IF UniversityProfile.INSERT(TRUE) THEN BEGIN
    //       status:='success*The University Milestone details were successfully addedd';
    //       END ELSE BEGIN;
    //       status:='danger*The University Milestone details were not addedd';
    //     END;*/


    // end;

    // procedure addAffiliations(universityCode: Code[50]; affiliationdescription: Text; countryname: Code[50]; organisationname: Text) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    // begin
    //     // NoticeNumber:=getInvitationNumber(universityCode);
    //     /*UniversityAffiliations.INIT;
    //     UniversityAffiliations."University Code":= universityCode;
    //     UniversityAffiliations."Affiliation description":= affiliationdescription;
    //     UniversityAffiliations.Country:= countryname;
    //     UniversityAffiliations."Organisation Name":=organisationname;
    //     UniversityAffiliations."Invitation No":=NoticeNumber;
    //     UniversityAffiliations."Submitted On":=CURRENTDATETIME;
    //     IF UniversityAffiliations.INSERT(TRUE) THEN BEGIN
    //       status:='success*The University Affiliations details were successfully submitted';
    //       END ELSE BEGIN;
    //       status:='danger*The University Affiliations details were not addedd';
    //     END;*/


    // end;

    // procedure addschoolFaculties(universityCode: Code[50]; facultydescription: Text) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    // begin

    //     /*UniversitySchool.INIT;
    //     UniversitySchool."University Code":= universityCode;
    //     UniversitySchool."School Name":= facultydescription;
    //     IF UniversitySchool.INSERT(TRUE) THEN BEGIN
    //       status:='success*The University school name details were successfully addedd';
    //       END ELSE BEGIN;
    //       status:='danger*The University school name details were not addedd';
    //     END;*/


    // end;

    // procedure addDepartments(universityCode: Code[50]; schoolcode: Code[10]; departmentname: Text) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin

    //     /*UniversityDepartments.INIT;
    //     UniversityDepartments."University Code":= universityCode;
    //     UniversityDepartments."School Code":=schoolcode;
    //     UniversityDepartments."Department Name":= departmentname;;
    //     IF UniversityDepartments.INSERT(TRUE) THEN BEGIN
    //       status:='success*The University department name details were successfully addedd';
    //       END ELSE BEGIN;
    //       status:='danger*The University department name details were not addedd';
    //     END;
    //     */


    // end;

    // procedure addSponsors(universityCode: Code[50]; sponsorname: Code[250]) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*UniversitySponsor.INIT;
    //     UniversitySponsor."University Code":= universityCode;
    //     UniversitySponsor."Sponsor Name":=sponsorname;
    //         IF UniversitySponsor.INSERT(TRUE) THEN BEGIN
    //       status:='success*The University Sponsors details were successfully Submitted';
    //       END ELSE BEGIN;
    //       status:='danger*The University Sponsors details were not Submitted';
    //     END;
    //     */


    // end;

    // procedure addHistory(universityCode: Code[50]; history: BigText) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    //     MemoWriter: OutStream;
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*status:='danger*The University profile details could not be updated';
    //    //NoticeNumber:=getInvitationNumber(universityCode);
    //    Customer.RESET;
    //    Customer.SETRANGE("No.", universityCode);
    //    IF Customer.FINDSET THEN BEGIN
    //    UniversityProfile.RESET;
    //    UniversityProfile.SETRANGE("University Code", universityCode);
    //    IF UniversityProfile.FINDSET THEN BEGIN
    //      UniversityProfile."Invitation Number":= NoticeNumber;
    //      UniversityProfile."Brief History".CREATEOUTSTREAM(MemoWriter);
    //      history.WRITE(MemoWriter);
    //        IF UniversityProfile.MODIFY(TRUE) THEN BEGIN
    //          status:='success*The University profile details were successfully updated';
    //          END;
    //      END ELSE BEGIN
    //        UniversityProfile.INIT;
    //        UniversityProfile."University Code":= universityCode;
    //        //UniversityProfile."Brief History":= history;
    //        UniversityProfile."Brief History".CREATEOUTSTREAM(MemoWriter);
    //       history.WRITE(MemoWriter);
    //       UniversityProfile."Invitation Number":= NoticeNumber;
    //        IF UniversityProfile.INSERT(TRUE) THEN BEGIN
    //          status:='success*The University profile details were successfully addedd';
    //          END;
    //        END;

    //     END ELSE BEGIN
    //        status:='danger*The given university does not exist'+universityCode;
    //        END;*/

    // end;

    // procedure editphylosophy(universityCode: Code[50]; phylosophydetails: BigText) status: Text
    // var
    //     Customer: Record Customer;
    //     NoticeNumber: Code[50];
    //     MemoWriter: OutStream;
    //     datacollectionDatasetID: Code[50];
    // begin
    //     /*status:='danger*The University profile details could not be updated';
    //     NoticeNumber:=getInvitationNumber(universityCode);
    //    Customer.RESET;
    //    Customer.SETRANGE("No.", universityCode);
    //    IF Customer.FINDSET THEN BEGIN
    //    UniversityProfile.RESET;
    //    UniversityProfile.SETRANGE("University Code", universityCode);
    //    IF UniversityProfile.FINDSET THEN BEGIN
    //      UniversityProfile."Invitation Number":= NoticeNumber;
    //      UniversityProfile."Philosophical Basis".CREATEOUTSTREAM(MemoWriter);
    //      phylosophydetails.WRITE(MemoWriter);
    //        IF UniversityProfile.MODIFY(TRUE) THEN BEGIN
    //          status:='success*The University Philosophical Basis/Niche of the University details were successfully updated';
    //          END;
    //      END ELSE BEGIN
    //        UniversityProfile.INIT;
    //        UniversityProfile."University Code":= universityCode;
    //        UniversityProfile."Philosophical Basis".CREATEOUTSTREAM(MemoWriter);
    //        phylosophydetails.WRITE(MemoWriter);
    //        UniversityProfile."Invitation Number":= NoticeNumber;
    //        IF UniversityProfile.INSERT(TRUE) THEN BEGIN
    //          status:='success*The University Philosophical Basis/Niche of the University details were successfully Submitted';
    //          END;
    //        END;

    //     END ELSE BEGIN
    //        status:='danger*The given university does not exist'+universityCode;
    //        END;
    //        */

    // end;

    // procedure ValidateLearningOutcome2(accreditationNo: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     ProgrammeOutcomes.RESET;
    //     ProgrammeOutcomes.SETRANGE("Institution Code", universityCode);
    //     ProgrammeOutcomes.SETRANGE("Application No.", accreditationNo);
    //     IF NOT ProgrammeOutcomes.FINDSET THEN  BEGIN
    //         status:='danger*The learning outcome were not successfully Submitted'
    //      END ELSE BEGIN
    //     Specialization.RESET;
    //     Specialization.SETRANGE(UniversityCode, universityCode);
    //     Specialization.SETRANGE("Application No.", accreditationNo);
    //     IF NOT Specialization.FINDSET THEN BEGIN
    //         status:='danger*The specializations Areas were not successfully Submitted';
    //         END ELSE BEGIN
    //        ProgramDeliveryMode.RESET;
    //       ProgramDeliveryMode.SETRANGE("Institution No.", universityCode);
    //       ProgramDeliveryMode.SETRANGE("Application No.", accreditationNo);
    //     IF NOT ProgramDeliveryMode.FINDSET THEN BEGIN
    //         status:='danger*The delivery mode was not successfully added';
    //         END ELSE BEGIN
    //         status:='success';
    //        END;
    //      END;
    //     END;
    //     */

    // end;

    // procedure addLearningOutcome(accreditationNo: Code[100]; outcomeDescription: BigText; outcomenomber: Code[50]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     MemoWriter: OutStream;
    //     outcomeNo: Text;
    //     OutcomeNumber: Text;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*Only one Learning Outcome is allowed and therefore the learning outcome details could not be added';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgrammeOutcomes.INIT;
    //       ProgrammeOutcomes."Application No.":= accreditationNo;
    //       ProgrammeOutcomes."Outcome Description".CREATEOUTSTREAM(MemoWriter);
    //       outcomeDescription.WRITE(MemoWriter);
    //       ProgrammeOutcomes."Institution Code":= universityCode;
    //       ProgrammeOutcomes."Outcome Code":= outcomenomber;
    //       ProgrammeOutcomes."Current Version":=TRUE;
    //       IF ProgrammeOutcomes.INSERT(TRUE) THEN BEGIN
    //         status:='success*The learning outcome was successfully added';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure editProgramRationale(rationaleCode: Integer; accreditationNo: Code[100]; rationaleCategory: Integer; rationaleDescription: BigText; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     MemoWriter: OutStream;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The program rationale could not be updated';
    //       ProgrammeRationale.RESET;
    //       ProgrammeRationale.SETRANGE("Application No.",accreditationNo);
    //       ProgrammeRationale.SETRANGE("Institution No.",universityCode);
    //       ProgrammeRationale.SETRANGE(Code, rationaleCode);
    //       IF ProgrammeRationale.FINDSET THEN BEGIN
    //         ProgrammeRationale.Category:= rationaleCategory;
    //         ProgrammeRationale."Category Description".CREATEOUTSTREAM(MemoWriter);
    //         rationaleDescription.WRITE(MemoWriter);
    //         ProgrammeRationale."Current Version":=TRUE;
    //           IF ProgrammeRationale.MODIFY(TRUE) THEN BEGIN
    //             status:='success*The program rationale was successfully updated';
    //             END ELSE BEGIN
    //           status:='success*The program rationale does not exist for the selected accreditation';
    //           END;
    //           END;*/

    // end;

    // procedure editSpecializationAreas(specializationCode: Integer; accreditationNo: Code[100]; specializationarea: Text; specializationdescription: BigText; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     MemoWriter: OutStream;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The program rationale could not be updated';
    //     Specialization.RESET;
    //     Specialization.SETRANGE(UniversityCode, universityCode);
    //     Specialization.SETRANGE("Application No.", accreditationNo);
    //     Specialization.SETRANGE(Code, specializationCode);
    //     IF Specialization.FINDSET THEN BEGIN
    //          Specialization."Specialization Area":= specializationarea;
    //         //  Specialization."Specialization Descriptions"specializationdescription;
    //         Specialization."Specialization Descriptions".CREATEOUTSTREAM(MemoWriter);
    //         specializationdescription.WRITE(MemoWriter);
    //         Specialization."Current Version":=TRUE;
    //           IF Specialization.MODIFY(TRUE) THEN BEGIN
    //             status:='success*The program specialization was successfully updated';
    //             END ELSE BEGIN
    //           status:='success*The program specialization does not exist for the selected accreditation';
    //           END;
    //         END;
    //         */

    // end;

    // procedure addSpecializationAreas(accreditationNo: Code[100]; specializationaraea: Text; specializationdescription: BigText; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     MemoWriter: OutStream;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The learning outcome could not be added';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
        
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       Specialization.INIT;
    //       Specialization."Application No.":= accreditationNo;
    //        Specialization.UniversityCode:= universityCode;
    //       Specialization."Specialization Area":= specializationaraea;
    //       Specialization."Specialization Descriptions".CREATEOUTSTREAM(MemoWriter);
    //       specializationdescription.WRITE(MemoWriter);
    //       Specialization."Current Version":=TRUE;
    //       IF Specialization.INSERT(TRUE) THEN BEGIN
    //         status:='success*The specialization Learning Outcome was successfully added';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure editLearningOutcome(accreditationNo: Code[100]; outcomeCode: Integer; outcomeDescription: BigText; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     MemoWriter: OutStream;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The learning outcome could not be updated';
    //     ProgrammeOutcomes.RESET;
    //     ProgrammeOutcomes.SETRANGE("Institution Code", universityCode);
    //     ProgrammeOutcomes.SETRANGE("Application No.", accreditationNo);
    //     ProgrammeOutcomes.SETRANGE(Code, outcomeCode);
    //     IF ProgrammeOutcomes.FINDSET THEN BEGIN
    //         ProgrammeOutcomes."Outcome Description".CREATEOUTSTREAM(MemoWriter);
    //        outcomeDescription.WRITE(MemoWriter);
    //         //ProgrammeOutcomes."Outcome Description":= outcomeDescription;
    //         ProgrammeOutcomes."Current Version":=TRUE;
    //         IF ProgrammeOutcomes.MODIFY(TRUE) THEN BEGIN
    //           status:='success*The learning outcome was successfully updated';
    //           END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;
    //         END;*/

    // end;

    // procedure deleteLearningOutcome(accreditationNo: Code[100]; outcomeCode: Integer; usercode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(usercode, password);
    //     status:='danger*The learning outcome could not be deleted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgrammeOutcomes.RESET;
    //       ProgrammeOutcomes.SETRANGE("Application No.", accreditationNo);
    //       ProgrammeOutcomes.SETRANGE(Code, outcomeCode);
    //       IF ProgrammeOutcomes.FINDSET THEN BEGIN
    //         IF ProgrammeOutcomes.DELETE(TRUE) THEN BEGIN
    //           status:='success*The learning outcome was successfully deleted';
    //           END;
        
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;
    //         */

    // end;

    // procedure deleteSpecializationArea(accreditationNo: Code[100]; specializationcode: Integer; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The learning outcome could not be deleted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       Specialization.RESET;
    //       Specialization.SETRANGE("Application No.", accreditationNo);
    //       Specialization.SETRANGE(Code, specializationcode);
    //       IF Specialization.FINDSET THEN BEGIN
    //         IF Specialization.DELETE(TRUE) THEN BEGIN
    //           status:='success*The Specialization Area was successfully deleted';
    //           END;
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //      END;*/

    // end;

    // procedure addDeliveryMode(accreditationNo: Code[100]; deliveryMode: Code[50]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     universityCode := getInstitutionNumber(userCode, password);
    //     /* ProgramDeliveryMode.INIT;
    //      ProgramDeliveryMode."Application No.":=accreditationNo;
    //      ProgramDeliveryMode."Institution No.":=universityCode;
    //      ProgramDeliveryMode."Delivery Mode Code":=deliveryMode;
    //      ProgramDeliveryMode."Institution No.":=universityCode;
    //      ProgramDeliveryMode."Current Version":=TRUE;
    //      ProgramDeliveryMode.VALIDATE("Delivery Mode Code");
    //      ProgramDeliveryMode."Current Version":=TRUE;
    //      IF ProgramDeliveryMode.INSERT(TRUE) THEN BEGIN
    //        status:='success*The delivery mode was successfully Submitted';
    //        END ELSE BEGIN
    //        status:='danger*Programme Delivery Mode Could Not be Submitted.This has already Been Submitted.';
    //        END;
    //        */

    //     /*ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgramDeliveryMode.RESET;
    //       ProgramDeliveryMode.SETRANGE("Institution No.", universityCode);
    //       ProgramDeliveryMode.SETRANGE("Application No.", accreditationNo);
    //       IF NOT ProgramDeliveryMode.FINDSET THEN BEGIN
    //       ProgramDeliveryMode.INIT;
    //       ProgramDeliveryMode."Application No.":=accreditationNo;
    //       ProgramDeliveryMode."Institution No.":=universityCode;
    //       ProgramDeliveryMode."Delivery Mode Code":=deliveryMode;
    //       ProgramDeliveryMode."Institution No.":=universityCode;
    //       ProgramDeliveryMode.VALIDATE("Delivery Mode Code");
    //       ProgramDeliveryMode."Current Version":=TRUE;
    //       IF ProgramDeliveryMode.INSERT(TRUE) THEN BEGIN
    //         status:='success*The delivery mode was successfully added';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*Programme Delivery Mode Could Not be Added.Only One Delivery Mode is Required Per Programme.';
    //         END;
    //         END;
    //      EXIT(status);*/


    // end;

    // procedure deleteDeliveryMode(accreditationNo: Code[100]; deliveryMode: Code[50]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The delivery mode could not be deleted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgramDeliveryMode.INIT;
    //       ProgramDeliveryMode.SETRANGE("Application No.",accreditationNo);
    //       ProgramDeliveryMode.SETRANGE("Delivery Mode Code",deliveryMode);
    //      IF ProgramDeliveryMode.FINDSET THEN BEGIN
    //       IF ProgramDeliveryMode.DELETE(TRUE) THEN BEGIN
    //         status:='success*The delivery mode was successfully deleted';
    //         END;
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;
    //         */

    // end;

    // procedure VlidateDeliveryMode2(accreditationNo: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*
    //     universityCode:= getInstitutionNumber(userCode, password);
    //     ProgramDeliveryMode.RESET;
    //     ProgramDeliveryMode.SETRANGE("Institution No.", universityCode);
    //     ProgramDeliveryMode.SETRANGE("Application No.", accreditationNo);
    //     IF NOT ProgramDeliveryMode.FINDSET THEN BEGIN
    //         status:='danger*The delivery mode was not successfully added';
    //         END ELSE BEGIN
    //     CourseCoreReadingMaterials.RESET;
    //     CourseCoreReadingMaterials.SETRANGE("Application No.", accreditationNo);
    //     IF NOT CourseCoreReadingMaterials.FINDSET THEN BEGIN
    //         status:='danger*The book was not successfully added';
    //         END ELSE BEGIN
    //         status:='success';
    //         END;
    //      END;
    //      */

    // end;

    // procedure addGradingSystem(accreditationNo: Code[100]; gradingCode: Code[100]; minimum: Decimal; maximum: Decimal; gpaPoints: Decimal; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       PorgrammeGrading.RESET;
    //       PorgrammeGrading.SETRANGE("Application No.","applicationno.");
    //       PorgrammeGrading.SETRANGE(Grade,gradingCode);
    //       IF PorgrammeGrading.FINDSET THEN BEGIN
    //       PorgrammeGrading."Application No.":= accreditationNo;
    //       PorgrammeGrading.Grade:= gradingCode;
    //       PorgrammeGrading."Minimum %":= maximum;
    //       PorgrammeGrading."Maximum %":= minimum;
    //       PorgrammeGrading."GPA Points":= gpaPoints;
    //       PorgrammeGrading."Current Version":=TRUE;
    //       IF PorgrammeGrading.MODIFY(TRUE) THEN BEGIN
    //         status:='success*The grade was successfully Modified';
    //         END ELSE BEGIN
    //         status:='danger*The grade was not successfully Modified. Kindly Try Again Later';
    //       END;
    //       END ELSE BEGIN
    //       PorgrammeGrading.INIT;
    //       PorgrammeGrading."Application No.":= accreditationNo;
    //       PorgrammeGrading.Grade:= gradingCode;
    //       PorgrammeGrading."Minimum %":= maximum;
    //       PorgrammeGrading."Maximum %":= minimum;
    //       PorgrammeGrading."GPA Points":= gpaPoints;
    //       PorgrammeGrading."Current Version":=TRUE;
    //       IF PorgrammeGrading.INSERT(TRUE) THEN BEGIN
    //         status:='success*The grade was successfully Submitted';
    //         END ELSE BEGIN
    //        status:='danger*The grade was not successfully Submitted';
    //       END;
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure ValidateGradingSystem2(accreditationNo: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     PorgrammeGrading.RESET;
    //     PorgrammeGrading.SETRANGE("Application No.", accreditationNo);
    //     IF NOT PorgrammeGrading.FINDSET THEN BEGIN
    //         status:='danger*The grade was not successfully added';
    //         END ELSE BEGIN
    //     ProgrammeCourseMatrix.RESET;
    //     ProgrammeCourseMatrix.SETRANGE("Application No.", accreditationNo);
    //     IF NOT ProgrammeCourseMatrix.FINDSET THEN BEGIN
    //         status:='danger*The unit was not successfully added';
    //         END ELSE BEGIN
    //     CourseLearningOutcome.RESET;
    //     CourseLearningOutcome.SETRANGE("Application No.", accreditationNo);
    //     IF NOT CourseLearningOutcome.FINDSET THEN BEGIN
    //         status:='danger*The course learning outcome was not successfully added';
    //         END ELSE BEGIN
    //         status:='success';
    //         END;
    //       END;
    //     END;*/

    // end;

    // procedure editGradingSystem(accreditationNo: Code[100]; "code": Integer; gradingCode: Code[100]; minimum: Decimal; maximum: Decimal; gpaPoints: Decimal; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The grading system could not be updated';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       PorgrammeGrading.RESET;
    //       PorgrammeGrading.SETRANGE(Code,code);
    //       PorgrammeGrading.SETRANGE("Application No.", accreditationNo);
    //       IF PorgrammeGrading.FINDSET THEN BEGIN
    //         PorgrammeGrading.Grade:= gradingCode;
    //         PorgrammeGrading."Minimum %":= minimum;
    //         PorgrammeGrading."Maximum %":= maximum;
    //         PorgrammeGrading."GPA Points":= gpaPoints;
    //         PorgrammeGrading."Current Version":=TRUE;
    //         IF PorgrammeGrading.MODIFY(TRUE) THEN BEGIN
    //           status:='success*The grade was successfully updated';
    //           END;
    //           END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure deleteGradingSystem(accreditationNo: Code[100]; "code": Integer; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The program rationale could not be updated';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //        PorgrammeGrading.RESET;
    //       PorgrammeGrading.SETRANGE(Code,code);
    //       PorgrammeGrading.SETRANGE("Application No.", accreditationNo);
    //       IF PorgrammeGrading.FINDSET THEN BEGIN
    //         IF PorgrammeGrading.DELETE(TRUE) THEN BEGIN
    //           status:='success*The grade was successfully deleted';
    //           END;
    //           END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/
    //     //51226

    // end;

    // procedure addUnit(accreditationNo: Code[100]; unitCode: Code[100]; unitTitle: Text; creditHours: Decimal; yearCode: Code[100]; courseCategory: Code[100]; coursecontent: BigText; instructional: BigText; courseassessment: BigText; recommendedref: BigText; discoverylearning: Boolean; problembasedlearning: Boolean; experientiallearning: Boolean; groupbasedlearning: Boolean; independentstudies: Boolean; lectures: Boolean; others: Text; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     MemoWriter: OutStream;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The Unit could not be Submitted.There is an already existing Course with the Provided Course Code';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //        ProgrammeCourseMatrix.INIT;
    //       ProgrammeCourseMatrix."Application No.":= accreditationNo;
    //       ProgrammeCourseMatrix."Course Code":= unitCode;
    //       ProgrammeCourseMatrix."Course Title":= unitTitle;
    //       ProgrammeCourseMatrix."Credit Hrs":= creditHours;
    //       ProgrammeCourseMatrix."Year Code":= yearCode;
    //       ProgrammeCourseMatrix."Course Category Code":= courseCategory;
    //       ProgrammeCourseMatrix.CourseContent.CREATEOUTSTREAM(MemoWriter);
    //       coursecontent.WRITE(MemoWriter);
    //       ProgrammeCourseMatrix.InstructionalMethod.CREATEOUTSTREAM(MemoWriter);
    //       instructional.WRITE(MemoWriter);
    //       ProgrammeCourseMatrix.CourseAssesment.CREATEOUTSTREAM(MemoWriter);
    //       courseassessment.WRITE(MemoWriter);
    //       ProgrammeCourseMatrix."Current Version":=TRUE;
    //       ProgrammeCourseMatrix."Discovery Learning Method":=discoverylearning;
    //       ProgrammeCourseMatrix."Group-Based Learning Method":=groupbasedlearning;
    //       ProgrammeCourseMatrix."Problem Based Learning Method":=problembasedlearning;
    //       ProgrammeCourseMatrix."Experiential learning Method":=experientiallearning;
    //       ProgrammeCourseMatrix."Independent Studies Method":=independentstudies;
    //       ProgrammeCourseMatrix."Lectures Method":=lectures;
    //       ProgrammeCourseMatrix."Others Instructional Methods":=others;
    //       IF ProgrammeCourseMatrix.INSERT(TRUE) THEN BEGIN
    //         status:='success*The Course Unit Details was successfully Submitted';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure editUnit(accreditationNo: Code[100]; "code": Integer; unitCode: Code[100]; unitTitle: Text; creditHours: Decimal; yearCode: Code[100]; courseCategory: Code[100]; comments: Text; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The unit could not be updated';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgrammeCourseMatrix.RESET;
    //       ProgrammeCourseMatrix.SETRANGE("Application No.",accreditationNo);
    //       ProgrammeCourseMatrix.SETRANGE(Code,code);
    //       IF ProgrammeCourseMatrix.FINDSET THEN BEGIN
    //         ProgrammeCourseMatrix.DELETE;
    //         ProgrammeCourseMatrix.INIT;
    //       ProgrammeCourseMatrix."Application No.":= accreditationNo;
    //       ProgrammeCourseMatrix."Course Code":= unitCode;
    //       ProgrammeCourseMatrix."Course Title":= unitTitle;
    //       ProgrammeCourseMatrix."Credit Hrs":= creditHours;
    //       ProgrammeCourseMatrix."Year Code":= yearCode;
    //       ProgrammeCourseMatrix."Course Category Code":= courseCategory;
    //       //ProgrammeCourseMatrix.Comments:= comments;
    //       ProgrammeCourseMatrix."Current Version":=TRUE;
    //       IF ProgrammeCourseMatrix.INSERT(TRUE) THEN BEGIN
    //         status:='success*The unit was successfully updated';
    //         END;
        
    //     END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure deleteUnit(accreditationNo: Code[100]; "code": Integer; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The unit could not be deleted '+FORMAT(code);;
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgrammeCourseMatrix.RESET;
    //       ProgrammeCourseMatrix.SETRANGE("Application No.",accreditationNo);
    //       ProgrammeCourseMatrix.SETRANGE(Code,code);
    //       IF ProgrammeCourseMatrix.FINDSET THEN BEGIN
    //       IF ProgrammeCourseMatrix.DELETE(TRUE) THEN BEGIN
    //         status:='success*The unit was successfully deleted';
    //         END;
        
    //     END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure addInstructionalMethod(accreditationNo: Code[100]; deliveryMode: Code[50]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The instructional method could not be Submitted.The Instructional method is already submitted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgramDeliveryMode.INIT;
    //       ProgramDeliveryMode."Application No.":=accreditationNo;
    //       ProgramDeliveryMode."Delivery Mode Code":=deliveryMode;
    //       ProgramDeliveryMode.VALIDATE("Delivery Mode Code");
    //       ProgramDeliveryMode."Current Version":=TRUE;
    //       IF ProgramDeliveryMode.INSERT(TRUE) THEN BEGIN
    //         status:='success*The Course Instructional Method was successfully Submitted';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure ValidateInstructionalMethod(accreditationNo: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     ProgramDeliveryMode.RESET;
    //     ProgramDeliveryMode.SETRANGE("Application No.", accreditationNo);
    //     IF NOT ProgramDeliveryMode.FINDSET THEN BEGIN
    //         status:='danger*The instructional method was successfully added';
    //         END ELSE BEGIN
    //         status:='success';
    //         END;*/

    // end;

    // procedure addInstructionalMethodEntry(deliveryMode: Code[50]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The instructional method could not be added';
    //     //ProgramAccreditationTable.RESET;
    //     //ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     //ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     //IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgramDeliveryMode.INIT;
    //      // ProgramDeliveryMode."Application No.":=accreditationNo;
    //       ProgramDeliveryMode."Institution No.":=universityCode;
    //       ProgramDeliveryMode."Delivery Mode Code":=deliveryMode;
    //       ProgramDeliveryMode.VALIDATE("Delivery Mode Code");
    //       IF ProgramDeliveryMode.INSERT(TRUE) THEN BEGIN
    //         status:='success*The instructional method was successfully added';
    //         END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure deleteInstructionalMethod(accreditationNo: Code[100]; "code": Integer; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The instructional method could not be deleted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgramDeliveryMode.RESET;
    //       ProgramDeliveryMode.SETRANGE("Application No.",accreditationNo);
    //       ProgramDeliveryMode.SETRANGE(Code,code);
    //       IF ProgramDeliveryMode.FINDSET THEN BEGIN
    //       IF ProgramDeliveryMode.DELETE(TRUE) THEN BEGIN
    //         status:='success*The instructional method was successfully deleted';
    //         END;
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure addCourseLearningOutcome(accreditationNo: Code[100]; learnigOutcomeCode: Code[100]; courseCode: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The course learning outcome could not be added';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       CourseLearningOutcome.INIT;
    //      CourseLearningOutcome."Application No.":=accreditationNo;
    //      CourseLearningOutcome.VALIDATE("Application No.");
    //      CourseLearningOutcome."Course Unit":= courseCode;
    //      CourseLearningOutcome.VALIDATE("Course Unit");
    //      CourseLearningOutcome."Institution No.":=universityCode;
    //      CourseLearningOutcome."Learning Outcome Description":= learnigOutcomeCode;
    //      //CourseLearningOutcome.VALIDATE("Learning Outcome Description");
    //      CourseLearningOutcome."Current Version":=TRUE;
    //       IF CourseLearningOutcome.INSERT(TRUE) THEN BEGIN
    //         status:='success*The Course Units Learning Outcomes was successfully Submitted';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure addBook(accreditationNo: Code[100]; bookTitle: Text; courseCode: Code[100]; authors: Text; yearOfPublication: Integer; publishers: Text; url: Text; print: Boolean; electronic: Boolean; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The book could not be added';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       CourseCoreReadingMaterials.INIT;
    //       CourseCoreReadingMaterials."Application No.":= accreditationNo;
    //       CourseCoreReadingMaterials."Course Code":=courseCode;
    //       CourseCoreReadingMaterials."Book Title":=bookTitle;
    //       CourseCoreReadingMaterials.Authors:= authors;
    //       CourseCoreReadingMaterials."Year of Publication":= yearOfPublication;
    //       CourseCoreReadingMaterials.Publishers:=publishers;
    //       CourseCoreReadingMaterials."Institution No.":=universityCode;
    //       CourseCoreReadingMaterials.URL:= url;
    //       CourseCoreReadingMaterials.Print:= print;
    //       CourseCoreReadingMaterials.Electronic:= electronic;
    //       CourseCoreReadingMaterials."Current Version":=TRUE;
    //       IF CourseCoreReadingMaterials.INSERT(TRUE) THEN BEGIN
    //         status:='success*The Core Reading Material was successfully Submitted';
    //         END ELSE BEGIN
    //        status:='danger*The Core Reading Material was not Submitted';
    //       END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure ValidateBook(accreditationNo: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     ProgrammeCourseMatrix.RESET;
    //     ProgrammeCourseMatrix.SETRANGE("Institution No.",universityCode);
    //     ProgrammeCourseMatrix.SETRANGE("Application No.",accreditationNo);
    //     IF ProgrammeCourseMatrix.FINDSET THEN BEGIN
    //     IF ProgrammeCourseMatrix."Course Code"=CourseCoreReadingMaterials."Course Code" THEN BEGIN
    //     REPEAT
    //     CourseCoreReadingMaterials.RESET;
    //     CourseCoreReadingMaterials.SETRANGE("Institution No.", universityCode);
    //     CourseCoreReadingMaterials.SETRANGE("Application No.", accreditationNo);
    //     CourseCoreReadingMaterials.SETFILTER(BookCount,'>=5');
    //     IF NOT CourseCoreReadingMaterials.FINDSET THEN BEGIN
    //         status:='danger*All book was not successfully submitted.Kindly Fill in all at least 5 Books for eacch Course Submitted before you Proceed!!';
    //         END ELSE BEGIN
    //         status:='success';
    //         END;
    //     UNTIL ProgrammeCourseMatrix.NEXT=0;
    //     END;
    //     END;*/

    // end;

    // procedure editBook(accreditationNo: Code[100]; "code": Integer; bookTitle: Text; courseCode: Code[100]; authors: Text; yearOfPublication: Integer; publishers: Text; url: Text; print: Boolean; electronic: Boolean; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The book could not be updated';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       CourseCoreReadingMaterials.RESET;
    //       CourseCoreReadingMaterials.SETRANGE("Application No.",accreditationNo);
    //       CourseCoreReadingMaterials.SETRANGE(Code,code);
    //       IF CourseCoreReadingMaterials.FINDSET THEN BEGIN
    //       CourseCoreReadingMaterials."Course Code":=courseCode;
    //       CourseCoreReadingMaterials."Book Title":=bookTitle;
    //       CourseCoreReadingMaterials.Authors:= authors;
    //       CourseCoreReadingMaterials."Year of Publication":= yearOfPublication;
    //       CourseCoreReadingMaterials.Publishers:=publishers;
    //       CourseCoreReadingMaterials.URL:= url;
    //       CourseCoreReadingMaterials.Print:= print;
    //       CourseCoreReadingMaterials.Electronic:= electronic;
    //       CourseCoreReadingMaterials."Current Version":=TRUE;
    //       IF CourseCoreReadingMaterials.MODIFY(TRUE) THEN BEGIN
    //         status:='success*The book was successfully updated';
    //         END;
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure deleteBook(accreditationNo: Code[100]; "code": Integer; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The book could not be deleted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       CourseCoreReadingMaterials.RESET;
    //       CourseCoreReadingMaterials.SETRANGE("Application No.",accreditationNo);
    //       CourseCoreReadingMaterials.SETRANGE(Code,code);
    //       IF CourseCoreReadingMaterials.FINDSET THEN BEGIN
    //       IF CourseCoreReadingMaterials.DELETE(TRUE) THEN BEGIN
    //         status:='success*The book was successfully deleted';
    //         END;
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure saveDocumentsInstProgrammes(accreditationNo: Code[100]; applicationLetter: Boolean; paymentDocument: Boolean; facilitiesdocument: Boolean; equipmentdocument: Boolean; coretextdocument: Boolean; academcistaffdocument: Boolean; universitypolicydocument: Boolean; evidencedocument: Boolean; PicturePolicy: BigText; FacilitiesImage: BigText; EquipmentsImage: BigText; CoretextImage: BigText; AcademicstaffImage: BigText; SupportstaffImage: BigText; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     OutStream1: OutStream;
    //     //  Bytes: dotnet Array;
    //     Instream1: InStream;
    //     Policytext: Text;
    // // Convert: dotnet Convert;
    // // MemoryStream: dotnet MemoryStream;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The accreditation with the given number Could not be Added.Kindly Contact Systems Administrator';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //      IF facilitiesdocument THEN
    //        ProgramAccreditationTable.FacilitiesDocument:= TRUE;
    //      IF equipmentdocument THEN
    //        ProgramAccreditationTable.EquipmentDocument:= TRUE;
    //      IF coretextdocument THEN
    //        ProgramAccreditationTable.CoreTextDocument:= TRUE;
    //       IF academcistaffdocument THEN
    //        ProgramAccreditationTable.AcademicStaffDocument:= TRUE;
    //        IF applicationLetter THEN
    //        ProgramAccreditationTable."Application Letter":= TRUE;
    //       IF universitypolicydocument THEN
    //        ProgramAccreditationTable.UniversityPolicy:= TRUE;
    //       IF evidencedocument THEN
    //        ProgramAccreditationTable.EvidenceDocument:= TRUE;
    //        IF paymentDocument THEN
    //        ProgramAccreditationTable."Payment Document":= TRUE;
    //        ProgramAccreditationTable.Status:=ProgramAccreditationTable.Status::"Awaiting Completeness Check" ;
    //        ProgramAccreditationTable."Reference No.":=accreditationNo+' '+'NEW';
    //         //Save Images
    //         Bytes := Convert.FromBase64String(PicturePolicy);
    //         MemoryStream := MemoryStream.MemoryStream(Bytes);
    //         ProgramAccreditationTable.UniversityFile.CREATEOUTSTREAM(OutStream1);
    //         MemoryStream.WriteTo(OutStream1);
        
    //         Bytes := Convert.FromBase64String(EquipmentsImage);
    //         MemoryStream := MemoryStream.MemoryStream(Bytes);
    //         ProgramAccreditationTable.EquipmentFile.CREATEOUTSTREAM(OutStream1);
    //         MemoryStream.WriteTo(OutStream1);
        
    //         Bytes := Convert.FromBase64String(FacilitiesImage);
    //         MemoryStream := MemoryStream.MemoryStream(Bytes);
    //         ProgramAccreditationTable.FacilitiesFile.CREATEOUTSTREAM(OutStream1);
    //         MemoryStream.WriteTo(OutStream1);
        
    //         Bytes := Convert.FromBase64String(CoretextImage);
    //         MemoryStream := MemoryStream.MemoryStream(Bytes);
    //         ProgramAccreditationTable.CoreTextFile.CREATEOUTSTREAM(OutStream1);
    //         MemoryStream.WriteTo(OutStream1);
        
    //         Bytes := Convert.FromBase64String(AcademicstaffImage);
    //         MemoryStream := MemoryStream.MemoryStream(Bytes);
    //         ProgramAccreditationTable.AcademicStaffFile.CREATEOUTSTREAM(OutStream1);
    //         MemoryStream.WriteTo(OutStream1);
        
        
    //         Bytes := Convert.FromBase64String(SupportstaffImage);
    //         MemoryStream := MemoryStream.MemoryStream(Bytes);
    //         ProgramAccreditationTable.SupportStaffFile.CREATEOUTSTREAM(OutStream1);
    //         MemoryStream.WriteTo(OutStream1);
        
    //        IF ProgramAccreditationTable.MODIFY(TRUE) THEN BEGIN
    //          status:='success*The accreditation was successfully Saved.Kindly track the Progress on the Ongoing Acrreditations.';
    //          END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure ConfirmPaymentsInstitution(accreditationNo: Code[100]; paymentDocument: Boolean; paymentRef: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     InstitutionAccreditation: Record "Ins. Accreditation Table";
    // begin

    //     //universityCode:= getInstitutionNumber(userCode, password);
    //     InstitutionAccreditation.Reset;
    //     InstitutionAccreditation.SetRange("Accreditation No.", accreditationNo);
    //     //InstitutionAccreditation.SETRANGE("University Approval",InstitutionAccreditation."University Approval"::Approved);
    //     if InstitutionAccreditation.FindSet then begin
    //         InstitutionAccreditation."Payment Document" := true;
    //         InstitutionAccreditation."Reference No." := paymentRef;
    //         InstitutionAccreditation.Status := InstitutionAccreditation.Status::"Awaiting Payment Processing";
    //         //  ProgramAccreditationTable.Status:=ProgramAccreditationTable.Status::"HOD Pending";
    //         if InstitutionAccreditation.Modify(true) then begin
    //             status := 'success* The Payments Details for the Accreditation No.' + accreditationNo + 'was successfully submitted';
    //         end;
    //     end else begin
    //         status := 'danger*The payment Details for' + ' ' + accreditationNo + ' ' + ' was not successfully submitted. Kindly try again';
    //     end;
    // end;

    // procedure editCourseLearningOutcome(accreditationNo: Code[100]; "code": Integer; learnigOutcomeCode: Code[100]; courseCode: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The course learning outcome could not be updated';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //      CourseLearningOutcome.RESET;
    //      CourseLearningOutcome.SETRANGE("Application No.",accreditationNo);
    //      CourseLearningOutcome.SETRANGE(Code,code);
    //      IF CourseLearningOutcome.FINDSET THEN BEGIN
    //      CourseLearningOutcome.VALIDATE("Application No.");
    //      CourseLearningOutcome."Course Unit":= courseCode;
    //      CourseLearningOutcome.VALIDATE("Course Unit");
    //      CourseLearningOutcome."Learning Outcome Description":= learnigOutcomeCode;
    //      CourseLearningOutcome."Current Version":=TRUE;
    //      //CourseLearningOutcome.VALIDATE("Learning Outcome");
    //       IF CourseLearningOutcome.MODIFY(TRUE) THEN BEGIN
    //         status:='success*The course learning outcome was successfully updated';
    //         END;
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure deleteCourseLearningOutcome(accreditationNo: Code[100]; "code": Integer; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The course learning outcome could not be deleted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       CourseLearningOutcome.RESET;
    //      CourseLearningOutcome.SETRANGE("Application No.",accreditationNo);
    //      CourseLearningOutcome.SETRANGE(Code,code);
    //      IF CourseLearningOutcome.FINDSET THEN BEGIN
        
    //       IF CourseLearningOutcome.DELETE(TRUE) THEN BEGIN
    //         status:='success*The course learning outcome was successfully deleted';
    //         END;
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure deleteProgramRationale(rationaleCode: Integer; accreditationNo: Code[100]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The program rationale could not be updated';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgrammeRationale.RESET;
    //       ProgrammeRationale.SETRANGE("Application No.",accreditationNo);
    //       ProgrammeRationale.SETRANGE(Code, rationaleCode);
    //       IF ProgrammeRationale.FINDSET THEN BEGIN
    //         IF ProgrammeRationale.DELETE(TRUE) THEN BEGIN
    //          status:='success*The program rationale was successfully deleted';
    //     END;
    //         END ELSE BEGIN
    //           status:='success*The program rationale does not exist for the selected accreditation';
    //           END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure InstitutionCreateinvoice(UniversityCode: Code[50]; usercode: Integer) status: Text
    // var
    //     InstitutionOnbording: Record "Ins. Accreditation Table";
    //     GenSetUp: Record "Accreditation Setups";
    //     SalesInv: Record "Sales Header";
    //     SalesLine: Record "Sales Line";
    //     FeeSchedule: Record "Acc Fee Schedules";
    // begin
    //     InstitutionOnbording.Reset;
    //     InstitutionOnbording.SetRange("Institution No.", UniversityCode);
    //     if InstitutionOnbording.FindSet then begin
    //         //InstitutionOnbording.TESTFIELD(Paid,FALSE);
    //         //InstitutionOnbording.TESTFIELD("Proposal Document",TRUE);
    //         //InstitutionOnbording.TESTFIELD("Application Letter",TRUE);
    //         //InstitutionOnbording.TESTFIELD("Payment Document",TRUE);
    //         //InstitutionOnbording.TESTFIELD("KRA Copy",TRUE);
    //         GenSetUp.Get();
    //         Amount := 0;
    //         FeeSchedule.Reset;
    //         FeeSchedule.SetRange(Blocked, false);
    //         FeeSchedule.SetRange(Description, InstitutionOnbording."Accreditation Type");
    //         if FeeSchedule.FindSet then begin
    //             Amount := FeeSchedule.Amount;
    //             No := UniversityCode;
    //         end;
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", InstitutionOnbording."Institution No.");
    //         SalesInv.SetRange("External Document No.", InstitutionOnbording."Accreditation No.");
    //         if SalesInv.Find('-') then begin
    //             Error('The Accreditation Details has already been Submitted.');
    //         end else begin
    //             SalesInv.Init;
    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", No);
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."External Document No." := InstitutionOnbording."Accreditation No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);

    //             SalesLine.Init;
    //             SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //             SalesLine."Document No." := SalesInv."No.";
    //             SalesLine.Type := SalesLine.Type::Resource;
    //             SalesLine.Validate(SalesLine."No.", GenSetUp.Resource);
    //             SalesLine.Validate(SalesLine.Quantity, 1);
    //             SalesLine.Validate(SalesLine."Unit Price", Amount);
    //             SalesLine.Insert(true);
    //             InstitutionOnbording."Invoice No." := SalesInv."No.";
    //             InstitutionOnbording.Invoiced := true;
    //             InstitutionOnbording."KRA Copy" := true;
    //             InstitutionOnbording."Application Letter" := true;
    //             InstitutionOnbording."Payment Document" := true;
    //             InstitutionOnbording."Proposal Document" := true;
    //             InstitutionOnbording.Modify;
    //             status := 'success*Invoice was successfully Generated';
    //         end;
    //     end;
    //     SalesInv.Reset;
    //     SalesInv.SetRange("Sell-to Customer No.", UniversityCode);
    //     SalesInv.SetRange("External Document No.", InstitutionOnbording."Accreditation No.");
    //     if SalesInv.Find('-') then begin
    //         univernumber1 := ConvertStr(UniversityCode, '-', '_');
    //         univernumber2 := ConvertStr(univernumber1, ':', '_');
    //         filelocation := 'C:\inetpub\wwwroot\cue\cue\cue\Downloads\' + 'ProformaInvoice_' + univernumber2 + '.pdf';
    //         // if Exists(filelocation) then begin
    //         //     Erase(filelocation);
    //         end;
    //         //Report.SaveAsPdf(1302, filelocation, SalesInv);
    //         status := 'success*Invoice was successfully Generated';
    //     end;
    //     /*
    //     UniversityUsers.RESET;
    //     UniversityUsers.SETRANGE(code,usercode);
    //      UniversityUsers.SETRANGE(UniversityCode,UniversityCode);
    //      IF UniversityUsers.FINDSET THEN BEGIN
    //       //SMTP.Create('Commission for University education','umis@cue.or.ke', UniversityUsers.Email,'University Program Accreditation ','Your Program Accreditation Details was Successfully submitted.', TRUE);
    //              //SMTP.AddCC('obadiahkorir@dynasoft.co.ke');
    //              //SMTP.Send();
    //     END;
    //     */

    // end;

    // procedure getOutComenNumber(institutionno: Code[50]) learningoutcomenumber: Text
    // var
    //     OutCome: Text;
    // begin
    //     /*ProgramOutcomes.RESET;
    //     ProgramOutcomes.SETCURRENTKEY(Code,"Outcome Code");
    //     ProgramOutcomes.SETRANGE("Institution Code",institutionno);
    //     IF ProgramOutcomes.FINDLAST THEN BEGIN
    //         learningoutcomenumber:=INCSTR(ProgramOutcomes."Outcome Code");
    //       END ELSE BEGIN
    //      learningoutcomenumber:='Outcome001';
    //     END;*/

    // end;

    // procedure FnUserHelpEmaiRequest(usercode: Code[50]; password: Text; email: Text; useremailsubject: Text; messagebody: Text) status: Text
    // var
    //     universityCode: Code[50];
    //     userCodeInt: Integer;
    //     emailSubject: Text;
    //     emailBody: Text;
    //     // Notification: Codeunit "SMTP Mail";
    //     // SMTPMailSet: Record "Email accounts";
    // begin
    //     /*UniversityUsers.RESET;
    //     universityCode:=getInstitutionNumber(usercode,password);
    //     EVALUATE(userCodeInt, usercode);
    //     UniversityUsers.SETRANGE("Entry No", userCodeInt);
    //     UniversityUsers.SETRANGE("Password Value", password);
    //     UniversityUsers.SETRANGE(UniversityCode,universityCode);
    //     IF UniversityUsers.FINDSET THEN BEGIN
    //              CashMgt.GET;
    //              Email1:= CashMgt."Imprest Email";
    //              DataCollectionSetup.GET;
    //              Email3:=DataCollectionSetup."Data Collection Email";
    //              Email4:=DataCollectionSetup."ICT Email Address";
    //              Email5:=DataCollectionSetup."ICT HOD Email Address";
    //              Email2:=UniversityUsers."Authentication Email";
    //              Sendername:=UniversityUsers."Full Name";
    //              Body:=emailSubject;
    //              //SMTP.Create(useremailsubject,Email1,Email3,
    //             useremailsubject,
    //              'Dear '+'Data Submission Support Officer'+',<BR><BR>'+
    //             'Please provide the above mentioned assistance to <b>'+' '+FORMAT(UniversityUsers."Full Name")+' '+'</b>'+'.<BR><BR>'+
    //             'Find the Assistance Request below:'+'<BR><BR>'+messagebody +'<BR><BR>'+
    //             'Kindly revert once this is resolved.Thank you'+' '+'<b><a href="https://imis.cue.or.ke/">UEMIS System</a></b>'
    //              ,TRUE);

    //             //SMTP.AddCC(Email2);
    //             //SMTP.AddCC(Email4);
    //             //SMTP.AddCC(Email5);
    //             //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>Planning,Research & Development Department<BR><BR>Commission For University Education.<BR>');
    //             //SMTP.Send();
    //             status:='success*Your Assistance request has been captured.Email Notification has been sent';
    //             END ELSE BEGIN
    //              status:='danger*Your Assistance request has not been captured.Email Notification has not been sent';
    //      END;
    //      */

    // end;

    // procedure addUniversityChancellors(UniversityCode: Code[30]; ChancellorName: Text; Qualifications: Code[30]; DateofAppointment: Date; Nationality: Code[30]) status: Text
    // var
    //     NoticeNumber: Code[50];
    // begin
    //     //NoticeNumber:=getInvitationNumber(UniversityCode);
    //     /* UniversityChancellors.INIT;
    //      UniversityChancellors."University Code":= UniversityCode;
    //      UniversityChancellors.Name:=ChancellorName ;
    //      UniversityChancellors."Highest Academic Qualification":=Qualifications;
    //      UniversityChancellors."Date of Appointment":=DateofAppointment;
    //      UniversityChancellors.Category:=UniversityChancellors.Category::Chancellor;
    //      UniversityChancellors.Nationality:=Nationality;
    //      UniversityChancellors."Submitted On":=CURRENTDATETIME;
    //    IF UniversityChancellors.INSERT(TRUE) THEN BEGIN
    //      status:= 'success*The University Chancellor details has been created successfully.';
    //      END ELSE BEGIN
    //        status:= 'success*The University Chancellor details has been created successfully.';
    //      END;
    //    EXIT(status);*/

    // end;

    // procedure InitialGeneralDetails(programName: Text; programDuration: Integer; programDomain: Code[50]; programLevel: Integer; phylosophy: BigText; totalcredit: Text; totalcourse: Integer; admission: BigText; goal: BigText; requlations: BigText; examinations: BigText; moderation: BigText; graduation: BigText; description: BigText; programanagement: BigText; studentspolicy: Text; userCode: Text; password: Text) status: Text
    // var
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    //     universityCode: Code[100];
    //     OStream: OutStream;
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //      IF ProgramAccreditationTable."Accreditation No."='' THEN BEGIN
    //       ProgramAccreditationTable.INIT;
    //       ProgramAccreditationTable."Institution No.":= universityCode;
    //       ProgramAccreditationTable.VALIDATE("Institution No.");
    //       //ProgramAccreditationTable."Institution Campus No.":=campus;
    //       //ProgramAccreditationTable.VALIDATE("Institution Campus No.");
    //       ProgramAccreditationTable."Program Name.":= programName;
    //       ProgramAccreditationTable."Programme Duration":= programDuration;
    //       ProgramAccreditationTable."Program Domain.":= programDomain;
    //       //ProgramAccreditationTable."GPA?":= gpa;
    //       ProgramAccreditationTable.PhilosophyoftheProgramme.CREATEOUTSTREAM(MemoWriter);
    //       phylosophy.WRITE(MemoWriter);
    //       ProgramAccreditationTable.TotalCreditHours:=totalcredit;
    //       ProgramAccreditationTable.TotalCourseUnits:=totalcourse;
    //       ProgramAccreditationTable.AdmissionRequirements.CREATEOUTSTREAM(MemoWriter);
    //       admission.WRITE(MemoWriter);
    //       ProgramAccreditationTable.GoaloftheProgramme.CREATEOUTSTREAM(OStream);
    //       goal.WRITE(OStream);
    //       ProgramAccreditationTable.RegulationsonCreditTransfer.CREATEOUTSTREAM(MemoWriter);
    //       requlations.WRITE(MemoWriter);
    //       ProgramAccreditationTable.StudentAssessmentPolicy:=studentspolicy;
    //       ProgramAccreditationTable.ExaminationRegulations.CREATEOUTSTREAM(MemoWriter);
    //       examinations.WRITE(MemoWriter);
    //       ProgramAccreditationTable.ModerationofExaminations.CREATEOUTSTREAM(MemoWriter);
    //       moderation.WRITE(MemoWriter);
    //       ProgramAccreditationTable.GraduationRequirements.CREATEOUTSTREAM(MemoWriter);
    //       graduation.WRITE(MemoWriter);
    //       ProgramAccreditationTable.DescriptionofThesis.CREATEOUTSTREAM(MemoWriter);
    //       description.WRITE(MemoWriter);
    //       ProgramAccreditationTable.ProgramManagement.CREATEOUTSTREAM(MemoWriter);
    //       programanagement.WRITE(MemoWriter);
    //       ProgramAccreditationTable."Current Version":=TRUE;
    //       ProgramAccreditationTable."Program Level":=programLevel;
        
    //       IF ProgramAccreditationTable.INSERT(TRUE) THEN BEGIN
    //         status:='success*The general details were successfully saved*'+ProgramAccreditationTable."Accreditation No.";
    //         END;
    //         END;
    //     EXIT(status);*/

    // end;

    // procedure addProgramRationale(accreditationNo: Code[50]; rationaleCategory: Integer; rationaleDescription: BigText; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     status:='danger*The program rationale  details could not be submitted.The Rationale Details had been Successfully SUbmitted';
    //     ProgramAccreditationTable.RESET;
    //     ProgramAccreditationTable.SETRANGE("Institution No.", universityCode);
    //     ProgramAccreditationTable.SETRANGE("Accreditation No.", accreditationNo);
    //     IF ProgramAccreditationTable.FINDSET THEN BEGIN
    //       ProgrammeRationale.INIT;
    //       ProgrammeRationale."Application No.":= accreditationNo;
    //       ProgrammeRationale.Category:= rationaleCategory;
    //       ProgrammeRationale."Category Description".CREATEOUTSTREAM(MemoWriter);
    //       rationaleDescription.WRITE(MemoWriter);
    //       ProgrammeRationale."Institution No.":=universityCode;
    //       ProgrammeRationale."Current Version":=TRUE;
    //       IF ProgrammeRationale.INSERT(TRUE) THEN BEGIN
    //         status:='success*The program rationale details was successfully submitted';
    //         END;
    //       END ELSE BEGIN
    //         status:='danger*An accreditation with the given number does not exist';
    //         END;*/

    // end;

    // procedure ValidateProgramRationale(accreditationNo: Code[50]; userCode: Text; password: Text) status: Text
    // var
    //     universityCode: Code[100];
    //     ProgramAccreditationTable: Record "Acc Fee Schedules";
    // begin
    //     /*universityCode:= getInstitutionNumber(userCode, password);
    //     ProgrammeRationale.RESET;
    //     ProgrammeRationale.SETRANGE("Institution No.", universityCode);
    //     ProgrammeRationale.SETRANGE("Application No.", accreditationNo);
    //     ProgrammeRationale.SETFILTER(RationaleCount,'>=3');
    //     IF NOT ProgrammeRationale.FINDSET THEN BEGIN
    //        status:='danger*Kindly Update all the three Programme Rationale before you proceed!!';
    //        END ELSE BEGIN
    //           status:='success';
    //     END;*/

    // end;

    // procedure FnGenerateExitReport(programmeNumber: Code[50]; university: Code[50]) status: Text
    // var
    //     ProgrammeEvaluationHeader: Record "Evaluation Header";
    //     ProgrammeSiteEvaluation: Record "Site Inspection Comment";
    // begin
    //     ProgrammeSiteEvaluation.Reset;
    //     ProgrammeSiteEvaluation.SetRange("Inst Application No.", programmeNumber);
    //     if ProgrammeSiteEvaluation.FindLast then begin
    //         Applicationnumber1 := ConvertStr(programmeNumber, '-', '_');
    //         Applicationnumber2 := ConvertStr(Applicationnumber1, ':', '_');
    //         FileName := Format(Applicationnumber2) + '.pdf';
    //         filelocation := 'C:\inetpub\wwwroot\Test\Downloads\Exit Report\' + Applicationnumber2 + '.pdf';
    //         if Exists(filelocation) then begin
    //             Erase(filelocation);
    //         end;
    //         //Report.SaveAsPdf(51193, filelocation, ProgrammeSiteEvaluation);
    //         status := 'success*Report was successfully Generated';
    //     end else begin
    //         status := 'danger* There was an Error in Generating the Exit Report, The Programme is not yet at the Resources Verifications Stage';
    //     end;
    //     //Save on the Portal(To be Downloadable)
    // end;

    // procedure FnGenerateProgrammeFeedbackVoucher(programmeNumber: Code[50]; university: Code[50]) status: Text
    // var
    //     ProgrammeEvaluationHeader: Record "Evaluation Header";
    //     ProgrammeEvaluationLines: Record "Application Lines";
    // begin
    //     ProgrammeEvaluationLines.Reset;
    //     ProgrammeEvaluationLines.SetRange("Application No.", programmeNumber);
    //     if ProgrammeEvaluationLines.FindLast then begin
    //         Applicationnumber1 := ConvertStr(programmeNumber, '-', '_');
    //         Applicationnumber2 := ConvertStr(Applicationnumber1, ':', '_');
    //         FileName := Format(Applicationnumber2) + '.pdf';
    //         filelocation := 'C:\inetpub\wwwroot\Test\Downloads\FeeedbackVoucher\' + Applicationnumber2 + '.pdf';
    //         if Exists(filelocation) then begin
    //             Erase(filelocation);
    //         end;
    //         //Report.SaveAsPdf(51155, filelocation, ProgrammeEvaluationLines);
    //         status := 'success*Report was successfully Generated';
    //     end else begin
    //         status := 'danger* There was an Error in Generating the Programme Feedback Report,The Programme with the Give Number Could not be Found!';
    //     end;
    //     //Save on the Portal(To be Downloadable)
    // end;

    // procedure FnGenerateProgrammeEvaluationToool(programmeNumber: Code[50]; university: Code[50]) status: Text
    // var
    //     ProgrammeEvaluationHeader: Record "Evaluation Header";
    //     ProgrammeEvaluationLines: Record "Application Lines";
    // begin
    //     ProgrammeEvaluationHeader.Reset;
    //     ProgrammeEvaluationHeader.SetRange("Application No.", programmeNumber);
    //     if ProgrammeEvaluationHeader.FindLast then begin
    //         Applicationnumber1 := ConvertStr(programmeNumber, '-', '_');
    //         Applicationnumber2 := ConvertStr(Applicationnumber1, ':', '_');
    //         FileName := Format(Applicationnumber2) + '.pdf';
    //         filelocation := 'C:\inetpub\wwwroot\Test\Downloads\EvaluationTool\' + Applicationnumber2 + '.pdf';
    //         if Exists(filelocation) then begin
    //             Erase(filelocation);
    //         end;
    //         //Report.SaveAsPdf(51151, filelocation, ProgrammeEvaluationHeader);
    //         status := 'success*Report was successfully Generated';
    //     end else begin
    //         status := 'danger* There was an Error in Generating the Programme Evaluation Report, The Programme is not yet at the Evalaution Stage';
    //     end;
    //     //Save on the Portal(To be Downloadable)
    // end;

    // procedure portalResetPassword(emailaddress: Text) status: Text
    // var
    //     RandomDigit: Text;
    // begin
    //     universityusers.Reset;
    //     universityusers.SetRange("Authentication Email", emailaddress);
    //     if universityusers.FindSet then begin
    //         RandomDigit := CreateGuid;
    //         RandomDigit := DelChr(RandomDigit, '=', '{}-01');
    //         RandomDigit := CopyStr(RandomDigit, 1, 8);
    //         universityusers."Password Value" := RandomDigit;
    //         universityusers."Last Modified Date" := Today;
    //         universityusers."Change Password" := false;
    //         universityusers.PasswordChanged := false;
    //         if universityusers.Modify(true) then begin
    //             status := 'success*Password Reset Successfully';
    //             ResetSendEmail(emailaddress);
    //         end else begin
    //             status := 'danger*The Password was Not Modified';
    //         end;
    //     end else begin
    //         status := 'danger*Email Address is Missing';
    //     end;

    // end;

    // procedure fngetRationaleDescription(accreditation: Code[50]; universitycode: Code[50]; category: Integer) description: Text
    // var
    //     MemoWriterIstream: InStream;
    //     MemoWriterBigtext: BigText;
    // begin

    //     /*rationale.RESET;
    //     rationale.SETRANGE("Application No.", accreditation);
    //     rationale.SETRANGE("Institution No.", universitycode);
    //     rationale.SETRANGE(Category,category);
    //     IF rationale.FIND('-') THEN
    //       BEGIN
    //         rationale.CALCFIELDS("Category Description");
    //         rationale."Category Description".CREATEINSTREAM(MemoWriterIstream);
    //         MemoWriterBigtext.READ(MemoWriterIstream);
    //         description:=FORMAT(MemoWriterBigtext);
    //         END
    //       ELSE BEGIN
    //      END;
    //      EXIT(description);*/



    // end;

    // procedure FngetUniversityDomain(UniversityCode: Code[50]) UniversityDomain: Text
    // var
    //     UniversityEmailDomains: Record "table";
    // begin
    //     /*UniversityEmailDomains.RESET;
    //     UniversityEmailDomains.SETRANGE("University Code",UniversityCode);
    //     IF UniversityEmailDomains.FINDSET THEN BEGIN
    //       UniversityDomain:=UniversityEmailDomains."University Domain";
    //       END ELSE BEGIN
    //       UniversityDomain:='';
    //       END;
    //       */

    // end;

    // procedure fnuseraccountcreation(idnumber: Text; firstname: Text; middlename: Text; lastname: Text; phonenumber: Text; emailaddress: Text; address: Text; postcodes: Text; city: Text; country: Text; universityname: Text; applicationType: Code[50]; InstitutionType: Code[50]; county: Code[50]; address2: Text) status: Text
    // var
    //     universitycontacts: Record Contact;
    //     NoSeriesManagement: Codeunit NoSeriesManagement;
    //     MarketingSetup: Record "Marketing Setup";
    //     Cust: Record Customer;
    //     ExaminationSetup1: Record "Examination Setup";
    //     AccreditationSetups: Record "Accreditation Setups";
    // begin
    //     universitycontacts.Reset;
    //     universitycontacts.SetRange("E-Mail", emailaddress);
    //     if universitycontacts.FindSet then begin
    //         status := 'danger*The User Account with the email address' + ' ' + emailaddress + ' ' + 'already exists.Kindly use the given credentials to login';
    //     end else begin
    //         universitycontacts.Init;
    //         universitycontacts."No." := '';
    //         universitycontacts."ID Number" := idnumber;
    //         universitycontacts.Name := universityname;
    //         universitycontacts.Validate(Name);
    //         universitycontacts.contactName := firstname + ' ' + middlename + ' ' + lastname;
    //         universitycontacts."First Name" := firstname;
    //         universitycontacts."Middle Name" := middlename;
    //         universitycontacts.Surname := lastname;
    //         universitycontacts.Type := universitycontacts.Type::Company;
    //         universitycontacts.Address := address;
    //         universitycontacts."Post Code" := postcodes;
    //         universitycontacts.Validate("Post Code");
    //         universitycontacts."Phone No." := phonenumber;
    //         universitycontacts."E-Mail" := emailaddress;
    //         universitycontacts.Address := address;
    //         universitycontacts."Country/Region Code" := country;
    //         universitycontacts."Institution Type Code" := InstitutionType;
    //         universitycontacts.Validate("Institution Type Code");
    //         universitycontacts."Application Type" := applicationType;
    //         universitycontacts.County := county;
    //         universitycontacts.Validate(County);
    //         universitycontacts."Address 2" := address2;
    //         //universitycontacts.VALIDATE("University Code");
    //         if universitycontacts.Insert(true) then begin
    //             status := 'success*The User Account  Details were successfully Submitted.';
    //             ExaminationSetup1.Get;
    //             ExaminationSetup1.TestField("Institution No.s");
    //             NoSeriesMgt.InitSeries(ExaminationSetup1."Institution No.s", Cust."No. Series", 0D, Cust."No.", Cust."No. Series");
    //             Cust.Name := universitycontacts.Name;
    //             Cust.Address := universitycontacts.Address;
    //             Cust."Post Code" := universitycontacts."Post Code";
    //             Cust.Validate("Post Code");
    //             Cust."Phone No." := universitycontacts."Phone No.";
    //             Cust."E-Mail" := universitycontacts."E-Mail";
    //             Cust."Customer Posting Group" := AccreditationSetups."Customer Posting Group";
    //             Cust."Gen. Bus. Posting Group" := AccreditationSetups."Gen. Bus. Posting Group";
    //             Cust."Customer Type" := Cust."customer type"::Trade;
    //             Cust."Customer Type" := Cust."customer type"::Funder;
    //             Cust.Contact := universitycontacts."No.";
    //             Cust.Insert;
    //             //          universityusers.RESET;
    //             //          universityusers.SETRANGE("Authentication Email",emailaddress);
    //             //          IF universityusers.FINDSET THEN BEGIN
    //             //            status:='danger*The User Account with the email address'+' '+emailaddress+' '+'already exists.Kindly use the given credentials to login';
    //             //            END ELSE BEGIN
    //             //              UniversityUsers."Authentication Email":=email;
    //             //              UniversityUsers."Mobile Phone No.":=ContactVar."Phone No.";
    //             //              UniversityUsers."User Name":=ContactVar."First Name"+'  '+ContactVar.Surname;
    //             //              UniversityUsers."Record Type":=UniversityUsers."Record Type"::Vendor;
    //             //              UniversityUsers."User Name":=ContactVar."E-Mail";
    //             //              UniversityUsers."Full Name":=ContactVar.Na
    //             //              UniversityUsers."Last Modified Date":=TODAY;
    //             //              RandomDigit := CREATEGUID;
    //             //              RandomDigit := DELCHR(RandomDigit,'=','{}-01');
    //             //              RandomDigit := COPYSTR(RandomDigit,1,8);
    //             //                UniversityUsers."Password Value":=RandomDigit;
    //             //                UniversityUsers.INSERT;
    //             //                SendEmailAcc(UniversityUsers);
    //             //              END






    //             SendEmailAccountCreation(emailaddress);
    //             //accountCreationEmailRequest(emailaddress,idnumber);
    //             //FnUseraccountCreationEmailRequest(emailaddress,idnumber);
    //         end else begin
    //             status := 'danger*The User Account has not been created successfully.Kindly try again later';
    //         end;
    //     end;
    // end;

    // procedure fnceateapplicationLines(Qncode: Code[250]; applicatinNumber: Code[50]; AccreditationAnswer: Text; Responce: Text) status: Text
    // var
    //     accreditationResponse: Record "Application Response";
    //     AccreditatioHeader: Record "Accreditation Application";
    // begin
    //     status := 'danger*could not capture your response';

    //     AccreditatioHeader.Reset;
    //     AccreditatioHeader.SetRange("Application No.", applicatinNumber);

    //     if AccreditatioHeader.FindSet then begin

    //         accreditationResponse.Init;

    //         accreditationResponse."Accreditation Answers" := AccreditationAnswer;
    //         accreditationResponse.Validate("Accreditation Answers");
    //         accreditationResponse.Response := Responce;
    //         accreditationResponse.Validate(Response);
    //         accreditationResponse."Question Code" := Qncode;
    //         accreditationResponse.Validate("Question Code");
    //         accreditationResponse."Application No." := applicatinNumber;
    //         accreditationResponse.Validate("Application No.");


    //         if accreditationResponse.Insert(true) then begin


    //             status := 'success*The application  was successfully added';
    //         end else begin
    //             status := 'danger*Your applicatione could not be added';

    //         end;


    //     end
    //     else begin
    //         status := 'danger*Application with the given number does not exist';

    //     end;

    //     exit(status);

    // end;

    // procedure AccreditationApplication(accreditationtype: Code[50]; name: Text; institutiontype: Code[100]; email: Text; phone: Text; applicationNo: Code[50]; AltEmailAddress: Text) status: Text
    // var
    //     AccrApplication: Record "Accreditation Application";
    //     Customer: Record Customer;
    // begin
    //     status := 'danger*could not capture your response';
    //     if applicationNo = '' then begin
    //         AccrApplication.Init;

    //         AccrApplication."Application No." := applicationNo;
    //         //AccrApplication.VALIDATE("Application No.");
    //         AccrApplication."Application Type" := accreditationtype;
    //         AccrApplication.Validate("Application Type");
    //         AccrApplication."Institution Type Code" := institutiontype;
    //         AccrApplication.Validate("Institution Type Code");
    //         AccrApplication.Email := email;
    //         AccrApplication.Validate(Email);
    //         AccrApplication."Phone No." := phone;
    //         AccrApplication.Validate("Phone No.");
    //         AccrApplication."No." := name;
    //         AccrApplication.Validate("No.");
    //         AccrApplication.AltEmail := AltEmailAddress;



    //         if AccrApplication.Insert(true) then begin
    //             Customer.Reset;
    //             Customer.SetRange("No.", AccrApplication."No.");
    //             if Customer.FindSet then begin
    //                 Customer."Institution alterEmail" := AltEmailAddress;
    //                 if Customer.Modify(true) then begin
    //                     status := 'success*The application  was successfully added*' + AccrApplication."Application No.";
    //                 end else begin
    //                     status := 'danger*Your application could not be added';
    //                 end
    //             end else begin
    //                 status := 'danger*Your application could not be added';
    //             end



    //         end else begin
    //             status := 'danger*Your application could not be added';
    //         end;

    //     end else begin
    //         AccrApplication.Reset;
    //         AccrApplication.SetRange("Application No.", applicationNo);
    //         if AccrApplication.FindSet then begin

    //             AccrApplication."Application No." := applicationNo;
    //             AccrApplication.Validate("Application No.");
    //             AccrApplication."Application Type" := accreditationtype;
    //             AccrApplication.Validate("Application Type");
    //             AccrApplication."Institution Type" := institutiontype;
    //             AccrApplication.Validate("Institution Type");
    //             AccrApplication.Email := email;
    //             AccrApplication.Validate(Email);
    //             AccrApplication."Phone No." := phone;
    //             AccrApplication.Validate("Phone No.");
    //             AccrApplication.AltEmail := AltEmailAddress;
    //             if AccrApplication.Modify(true) then begin

    //                 Customer.Reset;
    //                 Customer.SetRange("No.", AccrApplication."No.");
    //                 if Customer.FindSet then begin
    //                     Customer."Institution alterEmail" := AltEmailAddress;
    //                     if Customer.Insert(true) then begin
    //                         status := 'success*The application  was successfully added*' + AccrApplication."Application No.";
    //                     end else begin
    //                         status := 'danger*Your application could not be added';
    //                     end
    //                 end else begin
    //                     status := 'danger*Your application could not be added';
    //                 end
    //             end else begin
    //                 status := 'danger*Your Accreditation could not be captured';
    //             end;
    //         end;
    //     end;

    // end;

    // procedure createCampus(name: Text; category: Option; applicationNo: Code[10]; country: Code[10]; county: Code[10]) status: Text
    // var
    //     universityBranch: Record "Applicant Categories";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Your Purchase Line could not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         universityBranch.Init;
    //         //Document Type,Document No.,Line No.

    //         universityBranch.Name := name;
    //         universityBranch.Validate(Name);
    //         //        universityBranch."Post Code":=postcode;
    //         //        universityBranch.VALIDATE("Post Code");
    //         universityBranch."Application No." := accreditatinApplication."Application No.";
    //         universityBranch.Validate("Application No.");
    //         //        universityBranch.Address:=address;
    //         //        universityBranch.VALIDATE(Address);
    //         //        universityBranch.Contact:=contact;
    //         //        universityBranch.VALIDATE(Contact);
    //         universityBranch.Type := category;
    //         universityBranch.Validate(Type);
    //         universityBranch.Country := country;
    //         universityBranch.Validate(Country);
    //         //        universityBranch."Phone No.":=phone;
    //         //        universityBranch.VALIDATE("Phone No.");
    //         universityBranch.County := county;
    //         universityBranch.Validate(County);
    //         //        universityBranch.Email:=email;
    //         //        universityBranch.VALIDATE(Email);
    //         //        universityBranch.City:=city;
    //         //        universityBranch.VALIDATE(City);



    //         if universityBranch.Insert(true) then begin



    //             universityBranch.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure createOptionResponce(Optioncode: Text; applicationNo: Code[10]) status: Text
    // var
    //     accreditationResponse: Record "Application Response";
    //     AccreditatioHeader: Record "Accreditation Application";
    // begin
    //     status := 'danger*could not capture your response';

    //     AccreditatioHeader.Reset;
    //     AccreditatioHeader.SetRange("Application No.", applicationNo);

    //     if AccreditatioHeader.FindSet then begin

    //         accreditationResponse.Init;


    //         accreditationResponse."Accreditation Answers" := Optioncode;
    //         accreditationResponse.Validate("Question Code");
    //         accreditationResponse."Application No." := applicationNo;
    //         accreditationResponse.Validate("Application No.");


    //         if accreditationResponse.Insert(true) then begin


    //             status := 'success*The application  was successfully added';
    //         end else begin
    //             status := 'danger*Your applicatione could not be added';

    //         end;


    //     end
    //     else begin
    //         status := 'danger*Application with the given number does not exist';

    //     end;

    //     exit(status);

    // end;

    // procedure creatAccreditationResponce(qnCode: Code[50]; OptionResponce: Text; applicatinNumber: Code[10]) status: Text
    // var
    //     accreditationResponse: Record "Application Response";
    //     AccreditatioHeader: Record "Accreditation Application";
    // begin
    //     //status:='danger*could not capture your response';

    //     AccreditatioHeader.Reset;
    //     AccreditatioHeader.SetRange("Application No.", applicatinNumber);

    //     if AccreditatioHeader.FindSet then begin
    //         accreditationResponse.SetRange("Question Code", qnCode);
    //         accreditationResponse.SetRange("Application No.", applicatinNumber);
    //         if accreditationResponse.FindSet then begin
    //             accreditationResponse.Reset;
    //             accreditationResponse.Response := OptionResponce;
    //             accreditationResponse.Validate(Response);
    //             //accreditationResponse."Application No.":=applicatinNumber;
    //             //accreditationResponse.VALIDATE("Application No.");
    //             //accreditationResponse."Question Code":=qnCode;
    //             //accreditationResponse.VALIDATE("Question Code");
    //             if accreditationResponse.Modify(true) then begin
    //                 status := 'success*The application  was successfully modified';
    //             end else begin
    //                 status := 'danger*Your application could not be modifies';
    //             end;
    //         end else begin
    //             accreditationResponse.Init;
    //             //accreditationResponse.Response:=TextResponce;
    //             //accreditationResponse.VALIDATE(Response);
    //             accreditationResponse.Response := OptionResponce;
    //             accreditationResponse.Validate(Response);
    //             accreditationResponse."Application No." := applicatinNumber;
    //             accreditationResponse.Validate("Application No.");
    //             accreditationResponse."Question Code" := qnCode;
    //             accreditationResponse.Validate("Question Code");
    //             if accreditationResponse.Insert(true) then begin
    //                 status := 'success*The application  was successfully added';
    //             end else begin
    //                 status := 'danger*Your application could not be added';
    //             end;
    //         end

    //     end else begin
    //         status := 'danger*Application with the given number does not exist';
    //     end;

    //     exit(status);

    // end;

    // procedure createStaff(Description: Text; noofstaff: Integer; highestq: Code[10]; lowestq: Code[10]; category: Option; applicationNo: Code[10]) status: Text
    // var
    //     universityBranch: Record "Acc Administrative Staff";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Your Purchase Line could not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         universityBranch.Init;
    //         //Document Type,Document No.,Line No.

    //         universityBranch.Category := category;
    //         universityBranch.Validate(Category);
    //         universityBranch.Description := Description;
    //         universityBranch.Validate(Description);
    //         universityBranch."Application No." := applicationNo;
    //         universityBranch.Validate("Application No.");
    //         universityBranch."No. of Staff" := noofstaff;
    //         universityBranch.Validate("No. of Staff");
    //         universityBranch."Highest Academic Qualification" := highestq;
    //         universityBranch.Validate("Highest Academic Qualification");
    //         universityBranch."Lowest Academic Qualification" := lowestq;
    //         universityBranch.Validate("Lowest Academic Qualification");


    //         if universityBranch.Insert(true) then begin



    //             universityBranch.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure createTrainers(courseCode: Code[10]; CourseSection: Code[10]; parttimestudents: Integer; fulltimestudents: Integer; parttimetrainers: Integer; fulltimetrainers: Integer; highestQ: Code[10]; lowestQ: Code[10]; minLecHrs: Integer; maxLecHrs: Integer; micCoursehrs: Integer; maxcoursehrs: Integer; application: Code[10]) status: Text
    // var
    //     universityBranch: Record "Accreditation Trainers";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Your Purchase Line could not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", application);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         universityBranch.Init;
    //         //Document Type,Document No.,Line No.

    //         universityBranch."Course Code" := courseCode;
    //         universityBranch.Validate("Course Code");
    //         universityBranch."Course Section" := CourseSection;
    //         universityBranch.Validate("Course Section");
    //         universityBranch."Application No." := application;
    //         universityBranch.Validate("Application No.");
    //         universityBranch."No. of Parttime Students" := parttimestudents;
    //         universityBranch.Validate("No. of Parttime Students");
    //         universityBranch."No. of Fulltime Students" := fulltimestudents;
    //         universityBranch.Validate("No. of Fulltime Students");
    //         universityBranch."No. of Parttime Trainers" := parttimetrainers;
    //         universityBranch.Validate("No. of Parttime Trainers");
    //         universityBranch."No. of Fulltime Trainers" := fulltimetrainers;
    //         universityBranch.Validate("No. of Fulltime Trainers");
    //         universityBranch."Highest Trainer Qualification" := highestQ;
    //         universityBranch.Validate("Highest Trainer Qualification");
    //         universityBranch."Lowest Trainer Qualification" := lowestQ;
    //         universityBranch.Validate("Lowest Trainer Qualification");
    //         universityBranch."Min Lec Hrs Per Week Trainer" := minLecHrs;
    //         universityBranch.Validate("Min Lec Hrs Per Week Trainer");
    //         universityBranch."Max Lec Hrs Per Week Trainer" := maxLecHrs;
    //         universityBranch.Validate("Max Lec Hrs Per Week Trainer");
    //         universityBranch."Min Course Hrs Per Week Sem" := micCoursehrs;
    //         universityBranch.Validate("Min Course Hrs Per Week Sem");
    //         universityBranch."Max Course Hrs Per Week Sem" := maxcoursehrs;
    //         universityBranch.Validate("Max Course Hrs Per Week Sem");

    //         if universityBranch.Insert(true) then begin



    //             universityBranch.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure SittingCapacity(applicationNo: Code[10]; Examination: Code[10]; NoOfClasses: Integer; SittingSpace: Decimal; LargestClassSitting: Integer; SmallestClassSitting: Integer; TotalSittingCapacity: Integer) status: Text
    // var
    //     SittingCapacity: Record "Accreditation Seating Capacity";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Details not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         SittingCapacity.Init;
    //         //Document Type,Document No.,Line No.

    //         SittingCapacity.Examination := Examination;
    //         SittingCapacity.Validate(Examination);

    //         SittingCapacity."Application No." := applicationNo;
    //         SittingCapacity.Validate("Application No.");
    //         SittingCapacity."No. of Classrooms" := NoOfClasses;
    //         SittingCapacity.Validate("No. of Classrooms");
    //         SittingCapacity."Estimated Seating Space" := SittingSpace;
    //         SittingCapacity.Validate("Estimated Seating Space");
    //         SittingCapacity."Largest Class Seating capacity" := LargestClassSitting;
    //         SittingCapacity.Validate("Largest Class Seating capacity");
    //         SittingCapacity."Smallest ClassSeating capacity" := SmallestClassSitting;
    //         SittingCapacity.Validate("Smallest ClassSeating capacity");
    //         SittingCapacity."Total Seating capacity" := TotalSittingCapacity;
    //         SittingCapacity.Validate("Total Seating capacity");


    //         if SittingCapacity.Insert(true) then begin



    //             SittingCapacity.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure createRecomBooks(applicationNo: Code[10]; DomainARea: Code[10]; EstimatedNo: Integer; EstimatedTotalValue: Decimal; NoOfRecommBooks: Integer) status: Text
    // var
    //     RefBooks: Record "Accreditation Reference books";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Your Purchase Line could not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         RefBooks.Init;
    //         //Document Type,Document No.,Line No.

    //         RefBooks."Domain Area Code" := DomainARea;
    //         RefBooks.Validate("Domain Area Code");
    //         RefBooks."Estimated number" := EstimatedNo;
    //         RefBooks.Validate("Estimated number");
    //         RefBooks."Application No." := applicationNo;
    //         RefBooks.Validate("Application No.");
    //         RefBooks."Estimated total value" := EstimatedTotalValue;
    //         RefBooks.Validate("Estimated total value");
    //         RefBooks."No. of Recomm books" := NoOfRecommBooks;
    //         RefBooks.Validate("No. of Recomm books");



    //         if RefBooks.Insert(true) then begin



    //             RefBooks.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure createComputerLab(applicationNo: Code[10]; CompsLab: Text; SittingCapacity: Decimal; aVailableForTraining: Integer; Adapter: Integer; TotalSpace: Decimal) status: Text
    // var
    //     ComputerLab: Record "Accreditation Computer Labs";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Your Purchase Line could not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         ComputerLab.Init;
    //         //Document Type,Document No.,Line No.

    //         ComputerLab."Computer Laboratory" := CompsLab;
    //         ComputerLab.Validate("Computer Laboratory");
    //         ComputerLab."Seating capacity" := SittingCapacity;
    //         ComputerLab.Validate("Seating capacity");
    //         ComputerLab."Application No." := applicationNo;
    //         ComputerLab.Validate("Application No.");
    //         ComputerLab."No. available for training" := aVailableForTraining;
    //         ComputerLab.Validate("No. available for training");
    //         ComputerLab."No. with Adapter Cards" := Adapter;
    //         ComputerLab.Validate("No. with Adapter Cards");
    //         ComputerLab."Total space" := TotalSpace;
    //         ComputerLab.Validate("Total space");



    //         if ComputerLab.Insert(true) then begin



    //             ComputerLab.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure createCompDetails(applicationNo: Code[10]; NoOfComps: Integer; ProcessorType: Text; ProcessorSpeer: Text; RamCapacity: Text; HardDisk: Text) status: Text
    // var
    //     ComputerDetails: Record "Accreditation Computer Details";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Your Purchase Line could not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         ComputerDetails.Init;
    //         //Document Type,Document No.,Line No.

    //         ComputerDetails."No. of Computers" := NoOfComps;
    //         ComputerDetails.Validate("No. of Computers");
    //         ComputerDetails."Processor type" := ProcessorType;
    //         ComputerDetails.Validate("Processor type");
    //         ComputerDetails."Application No." := applicationNo;
    //         ComputerDetails.Validate("Application No.");
    //         ComputerDetails."Processor speed" := ProcessorSpeer;
    //         ComputerDetails.Validate("Processor speed");
    //         ComputerDetails."RAM Capacity" := RamCapacity;
    //         ComputerDetails.Validate("RAM Capacity");
    //         ComputerDetails."Hard disk capacity" := HardDisk;
    //         ComputerDetails.Validate("Hard disk capacity");



    //         if ComputerDetails.Insert(true) then begin



    //             ComputerDetails.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure createICTAccessory(applicationNo: Code[10]; AcademicTypeName: Text; TypeAvailable: Text; category: Option; Number: Integer) status: Text
    // var
    //     ICT: Record "ICT Equipment";
    //     accreditatinApplication: Record "Accreditation Application";
    // begin
    //     status := 'danger*Your Purchase Line could not be added';
    //     accreditatinApplication.Reset;
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     //PurchaseHeader.SETRANGE("Buy-from Vendor No.",fnGetLastOrderNo(vendorNumber));

    //     if accreditatinApplication.FindSet then begin

    //         //add line
    //         ICT.Init;
    //         //Document Type,Document No.,Line No.

    //         ICT.Category := category;
    //         ICT.Validate(Category);
    //         ICT."Academic ICT Type" := AcademicTypeName;
    //         ICT.Validate("Academic ICT Type");
    //         ICT."Application No." := applicationNo;
    //         ICT.Validate("Application No.");
    //         ICT."Type Available" := TypeAvailable;
    //         ICT.Validate("Type Available");

    //         ICT.Number := Number;
    //         ICT.Validate(Number);




    //         if ICT.Insert(true) then begin



    //             ICT.Modify(true);
    //             status := 'success*The category was successfully added';
    //         end else begin
    //             status := 'danger*Your category could not be added';
    //         end;

    //     end else begin
    //         status := 'danger*A category with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);


    // end;

    // procedure deleteCampusLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     universityBranch: Record "Applicant Categories";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         universityBranch.Reset;

    //         universityBranch.SetRange("Entry No.", lineNo);
    //         if universityBranch.FindSet then begin
    //             if universityBranch.Delete(true) then begin
    //                 status := 'success*The  Order Line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Order Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Order Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*A Order with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure deletestaffLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     universityBranch: Record "Acc Administrative Staff";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         universityBranch.Reset;

    //         universityBranch.SetRange("Entry No.", lineNo);
    //         if universityBranch.FindSet then begin
    //             if universityBranch.Delete(true) then begin
    //                 status := 'success*The  Order Line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Order Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Order Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*A Order with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure deletetrainerLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     universityBranch: Record "Accreditation Trainers";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         universityBranch.Reset;

    //         universityBranch.SetRange("Entry No.", lineNo);
    //         if universityBranch.FindSet then begin
    //             if universityBranch.Delete(true) then begin
    //                 status := 'success*The  Order Line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Order Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Order Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*A Order with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure deleteclassLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     SittingCapacity: Record "Accreditation Seating Capacity";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         SittingCapacity.Reset;

    //         SittingCapacity.SetRange("Entry No.", lineNo);
    //         if SittingCapacity.FindSet then begin
    //             if SittingCapacity.Delete(true) then begin
    //                 status := 'success*The  Order Line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Order Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Order Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*A Order with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure deleteRefBookLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     SittingCapacity: Record "Accreditation Reference books";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         SittingCapacity.Reset;

    //         SittingCapacity.SetRange("Entry No.", lineNo);
    //         if SittingCapacity.FindSet then begin
    //             if SittingCapacity.Delete(true) then begin
    //                 status := 'success*The  Order Line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Order Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Order Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*A Order with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure deleteCompLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     ComputerLab: Record "Accreditation Computer Labs";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         ComputerLab.Reset;

    //         ComputerLab.SetRange("Entry No.", lineNo);
    //         if ComputerLab.FindSet then begin
    //             if ComputerLab.Delete(true) then begin
    //                 status := 'success*The  Order Line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Order Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Order Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*A Order with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure deleteCompDetailsLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     ComputerDetails: Record "Accreditation Computer Details";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         ComputerDetails.Reset;

    //         ComputerDetails.SetRange("Entry No.", lineNo);
    //         if ComputerDetails.FindSet then begin
    //             if ComputerDetails.Delete(true) then begin
    //                 status := 'success*The  Order Line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Order Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Order Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*A Order with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure SelfEvaluationResponce(applicationNo: Code[50]; componentCode: Code[10]; questionCode: Code[10]; score: Decimal; comment: Text[250]; evaluationHeaderNo: Code[50]) status: Text
    // var
    //     EvalutionResponse: Record "Application Lines";
    //     EvaluationHeader: Record "Evaluation Header";
    // begin
    //     //status:='danger*could not capture your response';

    //     EvaluationHeader.Reset;
    //     EvaluationHeader.SetRange("Application No.", applicationNo);

    //     if EvaluationHeader.FindSet then begin

    //         EvalutionResponse.Init;


    //         EvalutionResponse."Application No." := applicationNo;
    //         EvalutionResponse.Validate("Application No.");
    //         EvalutionResponse."Evaluation Header No." := evaluationHeaderNo;
    //         EvalutionResponse.Validate("Evaluation Header No.");
    //         EvalutionResponse."Component Code" := componentCode;
    //         EvalutionResponse.Validate("Component Code");
    //         EvalutionResponse."Sub-Component Code" := questionCode;
    //         EvalutionResponse.Validate("Sub-Component Code");

    //         EvalutionResponse.Score := score;
    //         EvalutionResponse.Validate(Score);
    //         EvalutionResponse.Comment := comment;
    //         EvalutionResponse.Validate(Comment);

    //         if EvalutionResponse.Insert(true) then begin


    //             status := 'success*The application  was successfully added';
    //         end else begin
    //             status := 'danger*Your application could not be added';

    //         end;


    //     end
    //     else begin
    //         status := 'danger*Application with the given number does not exist';

    //     end;

    //     exit(status);

    // end;

    // procedure PrintCertificate(applicationNoFilter: Code[10]) status: Text
    // var
    //     ApplicationAccreditation: Record "Accreditation Application";
    //     cerrtificate: Report "Accreditation Certificate";
    //     printed: Boolean;
    // begin

    //     //rrstatus:='danger*could not generate your statement';
    //     ApplicationAccreditation.Reset;
    //     ApplicationAccreditation.SetRange("Application No.", applicationNoFilter);
    //     if ApplicationAccreditation.FindSet then begin
    //         ApplicationAccreditation.Reset;
    //         ApplicationAccreditation.SetRange("Application No.", applicationNoFilter);
    //         ApplicationAccreditation.SetFilter("Application No.", applicationNoFilter);

    //         if ApplicationAccreditation.FindSet then begin
    //             if FILE.Exists(FILESPATH2 + applicationNoFilter + '.pdf') then
    //                 FILE.Erase(FILESPATH2 + applicationNoFilter + '.pdf');
    //             cerrtificate.SaveAsPdf(FILESPATH2 + applicationNoFilter + '.pdf');
    //             status := 'success*downloads\certificate\' + applicationNoFilter + '.pdf';

    //         end
    //         else begin
    //             status := 'danger*Certificate  not found';
    //         end;


    //     end;
    // end;

    // procedure submitApplication(applicationNo: Code[50]) status: Text
    // var
    //     ApplicationAccreditation: Record "Accreditation Application";
    //     universityCode: Code[100];
    //     accredEmail: Text;
    //     finanEmail: Text;
    //     accredSetup: Record "Accreditation Setups";
    // begin
    //     status := 'danger* application Not submitted';

    //     accreditatinApplication.Reset;


    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     if accreditatinApplication.FindSet then begin
    //         accreditatinApplication.Status := accreditatinApplication.Status::"Awaiting Payment Processing";
    //         accreditatinApplication.Submitted := true;
    //         if accreditatinApplication.Modify(true) then begin
    //             SMTPMailSetup.Get;
    //             Email2 := SMTPMailSetup."Email Sender Address";
    //             Body := 'ACCREDITATION APPLICATION';
    //             //SMTP.Create('Accreditation Application', Email2, accreditatinApplication.Email,
    //            'ACCREDITATION APPLICATION',
    //             'Dear ' + accreditatinApplication.Name + ',<BR><BR>' +
    //            'We are pleased to inform you that your application for the' + ' ' + accreditatinApplication."Application Type Name" + ' has been Received Successfully <b>' + '</b><BR>' +
    //            'You can track your application progress in the accreditation portal<BR>' + ' ' + '<BR>'
    //            + '<BR>'
    //            , true);

    //             //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examinations <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //             accredSetup.Get;
    //             accredEmail := accredSetup."DCS Accreditatio Email Address";
    //             finanEmail := accredSetup."HOD Finance Email Address";
    //             //SMTP.AddCC(accredEmail);
    //             //SMTP.AddCC(finanEmail);
    //             //SMTP.Send();
    //             status := 'success* The  Accreditation details for' + ' ' + applicationNo + '' + 'was successfully submitted';
    //         end;
    //     end else begin

    //         status := 'danger*The Accreditation Details for' + ' ' + applicationNo + ' ' + 'has not been Approved by the VC.Kindly Send it for Approval.';
    //     end;
    // end;

    // procedure sendEmail(recipient: Text; title: Text; message: Text): Boolean
    // var
    //     objMail: Codeunit "SMTP Mail";
    //     SMTPMailSetup: Record "Email Account";
    // begin
    //     SMTPMailSetup.Get;
    //     objMail.Create(SMTPMailSetup."Email Sender Name", SMTPMailSetup."Email Sender Address", recipient, title, message, true);
    //     objMail.Send();
    // end;

    // procedure CreatAccreditationSubQResponce(qnCode: Code[50]; OptionResponce: Text; applicatinNumber: Code[10]; SubQnCode: Code[10]) status: Text
    // var
    //     accreditationResponse: Record "Application Sub-Ques Response";
    //     AccreditatioHeader: Record "Accreditation Application";
    // begin
    //     //status:='danger*could not capture your response';

    //     AccreditatioHeader.Reset;
    //     AccreditatioHeader.SetRange("Application No.", applicatinNumber);

    //     if AccreditatioHeader.FindSet then begin

    //         accreditationResponse.Init;


    //         accreditationResponse."Question Code" := qnCode;
    //         accreditationResponse.Validate("Question Code");
    //         accreditationResponse.Response := OptionResponce;
    //         accreditationResponse.Validate(Response);
    //         accreditationResponse."Application No." := applicatinNumber;
    //         accreditationResponse.Validate("Application No.");
    //         accreditationResponse."Subquestion Code" := SubQnCode;
    //         accreditationResponse.Validate("Subquestion Code");

    //         if accreditationResponse.Insert(true) then begin


    //             status := 'success*The application  was successfully added';
    //         end else begin
    //             status := 'danger*Your application could not be added';

    //         end;


    //     end
    //     else begin
    //         status := 'danger*Application with the given number does not exist';

    //     end;

    //     exit(status);

    // end;

    // procedure DeleteICTLine(applicationNo: Code[250]; lineNo: Integer) status: Text
    // var
    //     ICTDetails: Record "ICT Equipment";
    // begin
    //     status := 'danger*Your Order Line could not be deleted';
    //     accreditatinApplication.Reset;

    //     accreditatinApplication.SetRange(Status, accreditatinApplication.Status::Open);
    //     accreditatinApplication.SetRange("Application No.", applicationNo);
    //     if accreditatinApplication.FindSet then begin
    //         ICTDetails.Reset;

    //         ICTDetails.SetRange("Entry No.", lineNo);
    //         if ICTDetails.FindSet then begin
    //             if ICTDetails.Delete(true) then begin
    //                 status := 'success*The  line was successfully deleted';//+FORMAT(directUnitCost);
    //             end else begin
    //                 status := 'danger*Your Line could not be deleted';
    //             end;
    //         end else begin
    //             status := 'danger*The Line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*Application with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure SelfEvalutionApplication(applicationNo: Code[50]) status: Text
    // var
    //     EvalutionResponse: Record "Application Lines";
    //     EvaluationHeader: Record "Evaluation Header";
    // begin
    //     //status:='danger*could not capture your response';

    //     status := 'danger*could not capture your response';
    //     if code = '' then begin
    //         EvaluationHeader.Init;
    //         EvaluationHeader."Document Type" := EvaluationHeader."document type"::Accreditation;
    //         EvaluationHeader.Validate("Document Type");
    //         EvaluationHeader.Type := EvaluationHeader.Type::"Self-Evaluation";
    //         EvaluationHeader.Validate(Type);
    //         EvaluationHeader."Application No." := applicationNo;
    //         EvaluationHeader.Validate("Application No.");


    //         if EvaluationHeader.Insert(true) then begin


    //             status := 'success*The application  was successfully added*' + EvaluationHeader.Code;
    //         end else begin
    //             status := 'danger*Your application could not be added';
    //         end;

    //     end else begin
    //         EvaluationHeader.Reset;
    //         EvaluationHeader.SetRange("Application No.", applicationNo);
    //         if EvaluationHeader.FindSet then begin
    //             EvaluationHeader."Document Type" := EvaluationHeader."document type"::Accreditation;
    //             EvaluationHeader.Validate("Document Type");
    //             EvaluationHeader.Type := EvaluationHeader.Type::"Self-Evaluation";
    //             EvaluationHeader.Validate(Type);
    //             EvaluationHeader."Application No." := applicationNo;
    //             EvaluationHeader.Validate("Application No.");


    //             if EvaluationHeader.Modify(true) then begin
    //                 status := 'success*Your Application was successfully captured*' + EvaluationHeader.Code;
    //             end else begin
    //                 status := 'danger*Your Application could not be captured';
    //             end;
    //         end;
    //     end;
    // end;

    // procedure PrintScore(applicationNoFilter: Code[50]) status: Text
    // var
    //     SelfEvaluation: Record "Evaluation Header";
    //     scoreSheet: Report "Summary Evaluation Report";
    //     printed: Boolean;
    // begin

    //     status := 'danger*could not generate your score';
    //     SelfEvaluation.Reset;
    //     SelfEvaluation.SetRange(Code, applicationNoFilter);
    //     if SelfEvaluation.FindSet then begin
    //         SelfEvaluation.Reset;
    //         SelfEvaluation.SetRange(Code, applicationNoFilter);
    //         SelfEvaluation.SetFilter(Code, applicationNoFilter);

    //         if SelfEvaluation.FindSet then begin
    //             if FILE.Exists(FILESPATH3 + applicationNoFilter + '.pdf') then
    //                 FILE.Erase(FILESPATH3 + applicationNoFilter + '.pdf');
    //             scoreSheet.SaveAsPdf(FILESPATH3 + applicationNoFilter + '.pdf');
    //             status := 'success*downloads\scores' + applicationNoFilter + '.pdf';

    //         end
    //         else begin
    //             status := 'danger*scoresheet not found';
    //         end;


    //     end;
    // end;

    // procedure PrintdetailedReport(applicationNoFilter: Code[50]) status: Text
    // var
    //     SelfEvaluation: Record "Evaluation Header";
    //     scoreSheet: Report "Detailed Evaluation Report";
    //     printed: Boolean;
    // begin

    //     status := 'danger*could not generate your score';
    //     SelfEvaluation.Reset;
    //     SelfEvaluation.SetRange(SelfEvaluation.Code, applicationNoFilter);
    //     SelfEvaluation.SetFilter(SelfEvaluation.Code, '%1', applicationNoFilter);
    //     if SelfEvaluation.FindSet then begin

    //         appNo := ConvertStr(applicationNoFilter, '-', '_');
    //         appNo := ConvertStr(applicationNoFilter, ':', '_');

    //         if FILE.Exists(FILESPATH4 + appNo + '.pdf') then begin
    //             FILE.Erase(FILESPATH4 + appNo + '.pdf');
    //             //Report.SaveAsPdf(51151, FILESPATH4 + appNo + '.pdf', SelfEvaluation);
    //             status := 'success*downloads\detailedReport\' + appNo + '.pdf';
    //         end else begin

    //             //Report.SaveAsPdf(51151, FILESPATH4 + appNo + '.pdf', SelfEvaluation);
    //             status := 'success*downloads\detailedReport\' + appNo + '.pdf';
    //         end
    //     end else begin
    //         status := 'danger*The Report could not be generated';
    //     end;

    // end;

    // procedure ConfirmAccreditationPayment(applicationNo: Code[100]; paymentRef: Text) status: Text
    // var
    //     AccreditationApplicationPayment: Record "Accreditation Application";
    // begin


    //     AccreditationApplicationPayment.Reset;

    //     AccreditationApplicationPayment.SetRange("Application No.", applicationNo);
    //     //AccreditationApplicationPayment.SETRANGE(Approv,studentProcessing."Approval Status"::Released);
    //     if AccreditationApplicationPayment.FindSet then begin
    //         AccreditationApplicationPayment."Payment Document" := true;
    //         AccreditationApplicationPayment."Payment  Reference No." := paymentRef;
    //         //AccreditationApplicationPayment.P:=mode;
    //         AccreditationApplicationPayment.Status := AccreditationApplicationPayment.Status::"Awaiting Payment Processing";
    //         if AccreditationApplicationPayment.Modify(true) then begin
    //             status := 'success* The Payments Details for the Application No.' + applicationNo + 'was successfully submitted';
    //         end;
    //     end else begin
    //         status := 'danger*The Application Details for' + ' ' + applicationNo + ' ' + 'has not been Approved.';
    //     end;
    // end;

    // procedure FnCreateApplicantAccountRequest(emailaddress: Text) status: Text
    // var
    //     PortalUSer: Record "Dynasoft Portal User";
    //     RandomDigit: Text[50];
    //     entryno: Integer;
    //     ApplicantProfile: Record Customer;
    //     HumanResourcesSetup: Record "Examination Setup";
    //     Contact: Record Contact;
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    // begin
    //     /*Contact.RESET;
    //     Contact.SETRANGE("E-Mail",emailaddress);
    //     IF Contact.FINDSET THEN BEGIN
    //     HumanResourcesSetup.GET;
    //    ApplicantProfile.RESET;
    //    ApplicantProfile.SETRANGE("E-Mail",emailaddress);
    //    IF NOT ApplicantProfile.FINDSET THEN BEGIN
    //     ApplicantProfile.INIT;
    //     ApplicantProfile."No.":=NoSeriesMgt.GetNextNo(HumanResourcesSetup."Student Nos.",TODAY,TRUE);
    //     ApplicantProfile.Name:=Contact.Name;
    //     ApplicantProfile."Customer Type":=ApplicantProfile."Customer Type"::Student;
    //     ApplicantProfile."Funding Class":=ApplicantProfile."Funding Class"::Student;

    //     ApplicantProfile."E-Mail":=Contact."E-Mail";
    //     ApplicantProfile."Post Code":=Contact."Post Code";
    //     ApplicantProfile.City:=Contact.City;
    //     ApplicantProfile.Address:=Contact.Address;
    //     ApplicantProfile."Phone No.":=Contact."Phone No.";
    //     IF ApplicantProfile.INSERT(TRUE) THEN BEGIN*/
    //     // Update Dynasoft Portal user;
    //     PortalUSer.Reset;
    //     PortalUSer.SetRange("Authentication Email", emailaddress);
    //     if not PortalUSer.FindSet then begin
    //         PortalUSer.Init;
    //         PortalUSer."User Name" := Contact.Name;
    //         PortalUSer."Full Name" := Contact.Name;
    //         PortalUSer."Authentication Email" := Contact."E-Mail";
    //         PortalUSer."Mobile Phone No." := Contact."Phone No.";
    //         PortalUSer.State := PortalUSer.State::Enabled;
    //         PortalUSer."Record Type" := PortalUSer."record type"::Customer;
    //         PortalUSer."Record ID" := ApplicantProfile."No.";
    //         RandomDigit := CreateGuid;
    //         RandomDigit := DelChr(RandomDigit, '=', '{}-01');
    //         RandomDigit := CopyStr(RandomDigit, 1, 8);
    //         PortalUSer."Password Value" := RandomDigit;
    //         PortalUSer."Last Modified Date" := Today;
    //         if PortalUSer.Insert(true) then begin
    //             ;
    //         end;
    //     end;
    //     /*END;
    //     END;
    //     END;*/

    // end;

    // procedure PrintdApplicationReport(applicationNoFilter: Code[50]; "code": Code[50]) status: Text
    // var
    //     AccrApplication: Record "Accreditation Application";
    //     ApplicationForm: Report "Application Form";
    //     printed: Boolean;
    // begin
    //     AccrApplication.Reset;
    //     AccrApplication.SetRange("Application No.", applicationNoFilter);
    //     AccrApplication.SetFilter(AccrApplication."No.", '%1', code);
    //     if AccrApplication.FindSet then
    //         if FILE.Exists(FILESPATH5 + code + '.pdf') then begin
    //             FILE.Erase(FILESPATH5 + code + '.pdf');
    //             //Report.SaveAsPdf(51251, FILESPATH5 + code + '.pdf', AccrApplication);
    //             status := 'success*downloads\ApplicationForm\' + code + '.pdf';
    //         end else begin
    //             //Report.SaveAsPdf(51251, FILESPATH5 + code + '.pdf', AccrApplication);
    //             status := 'success*downloads\ApplicationForm\' + code + '.pdf';
    //         end
    //     else begin
    //         status := 'danger*The Applicatioon Form could not be generated';
    //     end;

    // end;

    // procedure SendEmailAccountCreation(email: Text) status: Text
    // var
    //     contact: Record Contact;
    //     universityCode: Code[100];
    // begin
    //     status := 'danger* application Not submitted';

    //     contact.Reset;


    //     contact.SetRange("E-Mail", email);
    //     // accreditatinApplication.SETRANGE(Status,accreditatinApplication.Status::Open);
    //     if contact.FindSet then begin
    //         //accreditatinApplication.Status:=accreditatinApplication.Status::"Awaiting Payment Processing";
    //         //IF accreditatinApplication.MODIFY(TRUE) THEN BEGIN
    //         SMTPMailSetup.Get;
    //         Email2 := SMTPMailSetup."Email Sender Address";
    //         Body := 'ACCREDITATION APPLICATION ACCOUNT CREATION';
    //         //SMTP.Create('Accreditation Application', Email2, contact."E-Mail",
    //        'ACCREDITATION APPLICATION',
    //        'Dear ' + contact.Name + ',<BR><BR>' +
    //        'We are pleased to inform you that your request for account creation has been received Successfully.  <b>' + '</b><BR>' +
    //        'Please wait for the login credentials that will be sent to you via the email.<BR>' + ' ' + '<BR>'
    //        + '<BR>'
    //        , true);

    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examinations <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //         //SMTP.Send();
    //         status := 'success* The Account request application : ' + email + 'was successfully submitted';
    //         // END;
    //     end else begin

    //         status := 'danger*The Account request application not submitted' + email;
    //     end;
    // end;

    // procedure Printdsummeryscore(applicationNoFilter: Code[50]) status: Text
    // var
    //     SelfEvaluation: Record "Evaluation Header";
    //     ApplicationForm: Report "Application Form";
    //     printed: Boolean;
    // begin
    //     status := 'danger*could not generate your score';
    //     SelfEvaluation.Reset;
    //     SelfEvaluation.SetRange(SelfEvaluation.Code, applicationNoFilter);
    //     SelfEvaluation.SetFilter(SelfEvaluation.Code, '%1', applicationNoFilter);
    //     if SelfEvaluation.FindSet then begin

    //         appNo := ConvertStr(applicationNoFilter, '-', '_');
    //         appNo := ConvertStr(applicationNoFilter, ':', '_');

    //         if FILE.Exists(FILESPATH6 + appNo + '.pdf') then begin
    //             FILE.Erase(FILESPATH6 + appNo + '.pdf');
    //             //Report.SaveAsPdf(51150, FILESPATH6 + appNo + '.pdf', SelfEvaluation);
    //             status := 'success*downloads\SummeryScore\' + appNo + '.pdf';
    //         end else begin

    //             //Report.SaveAsPdf(51150, FILESPATH6 + appNo + '.pdf', SelfEvaluation);
    //             status := 'success*downloads\SummeryScore\' + appNo + '.pdf';
    //         end
    //     end else begin
    //         status := 'danger*The Report could not be generated';
    //     end;


    // end;

    // procedure FnResetPassword(emailaddress: Text) passChangestatus: Text
    // var
    //     DynasoftPortalUser: Record UniversityUsers;
    //     RandomDigit: Text;
    //     Body: Text;
    // begin
    //     DynasoftPortalUser.Reset;
    //     DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
    //     if DynasoftPortalUser.FindSet then begin
    //         RandomDigit := CreateGuid;
    //         RandomDigit := DelChr(RandomDigit, '=', '{}-01');
    //         RandomDigit := CopyStr(RandomDigit, 1, 8);
    //         DynasoftPortalUser."Password Value" := RandomDigit;
    //         DynasoftPortalUser."Last Modified Date" := Today;
    //         DynasoftPortalUser."Change Password" := false;
    //         DynasoftPortalUser."Record Type" := DynasoftPortalUser."record type"::Customer;
    //         if DynasoftPortalUser.Modify(true) then begin
    //             passChangestatus := 'success*Password Reset Successfully';
    //             ResetSendEmail(emailaddress);
    //         end else begin
    //             passChangestatus := 'danger*The Password was Not Modified';
    //         end;
    //     end else begin
    //         passChangestatus := 'emailnotfound*Email Address is Missing';
    //     end;
    // end;

    // procedure ResetSendEmail(emailaddress: Text)
    // var
    //     DynasoftPortalUser: Record UniversityUsers;
    //     SMTPMailSetup: Record "Email Account";
    //     Email2: Text;
    //     Body: Text;
    //     SMTP: Codeunit "Email Message";
    // begin
    //     DynasoftPortalUser.Reset;
    //     DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
    //     if DynasoftPortalUser.FindSet then begin
    //         SMTPMailSetup.Get;
    //         Email2 := SMTPMailSetup."Email Sender Address";
    //         Body := 'Training institution Password Reset';
    //         //SMTP.Create('Training institution Password Reset', Email2, emailaddress,
    //        'Training institution Password Reset',
    //        'Dear ' + DynasoftPortalUser."Full Name" + ',<BR><BR>' +
    //        'Your Password for the account <b>' + ' ' + Format(DynasoftPortalUser."Authentication Email") + ' ' + '</b> has been Reset Successfully.Kindly Change your Password on Login<BR>' +
    //        'Use the following link to access the Accreditation Portal.' + ' ' + '<b><a href="#">Accreditation Portal</a></b><BR>Your New Credentials are:'
    //        + '<BR>'
    //        + 'Username:' + ' <b>' + DynasoftPortalUser."Authentication Email" + '</b><BR>Password:' + ' <b>' + DynasoftPortalUser."Password Value" + '</b>'
    //      , true);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Human Resource <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //         //SMTP.Send();
    //     end;
    // end;

    // procedure FnChangeStudentPassword(emailaddress: Text; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
    // var
    //     DynasoftPortalUser: Record UniversityUsers;
    // begin

    //     DynasoftPortalUser.Reset;
    //     DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
    //     if DynasoftPortalUser.FindSet then begin
    //         if DynasoftPortalUser."Password Value" = currentPassword then begin
    //             if newPassword = confirmNewPassword then begin
    //                 DynasoftPortalUser."Password Value" := newPassword;
    //                 DynasoftPortalUser."Change Password" := true;
    //                 DynasoftPortalUser."Last Modified Date" := Today;
    //                 if DynasoftPortalUser.Modify(true) then begin
    //                     status := 'success*Your password was successfully changed';
    //                 end else begin
    //                     status := 'danger*Your password could not be reset';
    //                 end;
    //             end else begin
    //                 status := 'password mismatch*New password and Confirmed new password do not match';
    //             end;
    //         end else begin
    //             status := 'worng current password*Wrong current password.Kindly Ensure that the Current Password is Correct';
    //         end;
    //     end else begin
    //         status := 'no student found*The specified Email Address does not exist';
    //     end;
    // end;

    // procedure AddAccreditationSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    // var
    //     Accreditation: Record "Accreditation Application";
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **************************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID" = 0 then begin
    //         RecordLink.URL1 := sharepointlink;
    //         RecordLink.Description := filename;
    //         RecordLink.Type := RecordLink.Type::Link;
    //         RecordLink.Company := COMPANYNAME;
    //         RecordLink."User ID" := UserId;
    //         RecordLink.Created := CreateDatetime(Today, Time);
    //         Accreditation.Reset;
    //         Accreditation.SetRange("Application No.", applicationNo);

    //         if Accreditation.FindSet then
    //             RecordIDNumber := Accreditation.RecordId;
    //         RecordLink."Record ID" := RecordIDNumber;
    //         if RecordLink.Insert(true) then begin
    //             status := 'success*The document was successfully attached';
    //         end else begin
    //             status := 'error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;


    // procedure CreateAppeal(CaseRegister: Record "Case Register")
    // var
    //     CaseRegister1: Record "Case Register";
    //     HRSetup: Record "Human Resources Setup";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     "CaseNo.": Code[30];
    //     TXT001: label 'Appeal %1 created successfully';
    //     Defandants: Record "Case Plantiff-Defandants";
    //     Plantiff: Record "Case Plantiff-Defandants";
    // begin
    //     CaseRegister1.TransferFields(CaseRegister);
    //     HRSetup.Get;
    //     HRSetup.TestField(HRSetup."Legal Case Nos");
    //     NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos", CaseRegister1."No series", 0D, "CaseNo.", CaseRegister1."No series");
    //     //create header

    //     CaseRegister1."No." := "CaseNo.";
    //     CaseRegister1.Status := CaseRegister1.Status::Appeal;
    //     CaseRegister1.Insert;


    //     //insert defendant
    //     Plantiff.Reset;
    //     Plantiff.SetRange("Case No", CaseRegister."No.");
    //     Plantiff.SetRange(Type, Plantiff.Type::Plaintiff);
    //     if Plantiff.FindSet then begin
    //         repeat
    //             //insert in witness
    //             Defandants.TransferFields(Plantiff);
    //             Defandants."Case No" := "CaseNo.";
    //             Defandants.Type := Defandants.Type::Defendant;
    //             Defandants.Insert;

    //         until Plantiff.Next = 0;
    //     end;

    //     //insert plaintiff
    //     Plantiff.Reset;
    //     Plantiff.SetRange("Case No", CaseRegister."No.");
    //     Plantiff.SetRange(Type, Plantiff.Type::Defendant);
    //     if Plantiff.FindSet then begin
    //         repeat
    //             //insert in witness
    //             Defandants.TransferFields(Plantiff);
    //             Defandants."Case No" := "CaseNo.";
    //             Defandants.Type := Defandants.Type::Plaintiff;
    //             Defandants.Insert;

    //         until Plantiff.Next = 0;
    //     end;
    //     Message(TXT001, CaseRegister1."No.");
    // end;


    // procedure SendEmailAcc(UniversityUsers: Record UniversityUsers)
    // var
    //     UniversityUsers1: Record UniversityUsers;
    //     Email2: Text;
    //     SMTP: Codeunit "Email Message";
    //     Body: Text;
    //     ExaminationSetup: Record "Examination Setup";
    // begin
    //     UniversityUsers.SetRange("Authentication Email", UniversityUsers."Authentication Email");
    //     if UniversityUsers.FindSet then begin
    //         //code to send email and link to universities
    //         //send notification email

    //         ExaminationSetup.Get;
    //         ExaminationSetup.TestField("Library SignUp Email");
    //         Email2 := 'accred@kasneb.or.ke';

    //         //SMTP.Create('ACCOUNT CREATION', Email2, UniversityUsers."Authentication Email",
    //         ' ACCOUNT CREATION',
    //          'Dear ' + UniversityUsers."Full Name" + ',<BR><BR>' +
    //          'Your Accreditation login account has been created in the System.<BR>' +
    //          'Use the following link to acess the system.' + ' ' + '<b><a href="http://192.168.0.95:8097/">KASNEB ACCREDITATION PORTAL</a></b><BR>The credentials are:'
    //          + '<BR>'
    //          + 'Username:' + ' <b>' + UniversityUsers."Authentication Email" + '</b><BR>Password:' + ' <b>' + UniversityUsers."Password Value" + '</b>'
    //       , true);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>' + COMPANYNAME + '.<BR>');
    //         //SMTP.Send();

    //         DocLog.Reset;
    //         if DocLog.FindLast then begin
    //             Counter := DocLog."Entry No";
    //         end;           //record sending details
    //         DocLog.Init;
    //         DocLog."Entry No" := Counter + 1;
    //         //DocLog."Customer No":=UniversityUser.UniversityCode;
    //         //DocLog."Customer Name":=UniversityUser."University Name";
    //         DocLog."Document Type" := DocLog."document type"::" ";
    //         DocLog."E-mailed To" := UniversityUsers."Authentication Email";
    //         DocLog.Date := Today;
    //         DocLog.Time := Time;
    //         DocLog."Sender ID" := UserId;
    //         DocLog.Insert(true);
    //         Message('Notification successfully sent to %1', UniversityUsers."User Name");
    //     end
    // end;

    // procedure fnuseraccountcreation2(idnumber: Text; firstname: Text; middlename: Text; lastname: Text; phonenumber: Text; emailaddress: Text; address: Text; postcodes: Text; city: Text; country: Text; universityname: Text; applicationType: Code[50]; InstitutionType: Code[50]; county: Code[50]; address2: Text) status: Text
    // var
    //     universitycontacts: Record Contact;
    //     NoSeriesManagement: Codeunit NoSeriesManagement;
    //     MarketingSetup: Record "Marketing Setup";
    //     Cust: Record Customer;
    //     ExaminationSetup1: Record "Examination Setup";
    //     AccreditationSetups: Record "Accreditation Setups";
    //     RandomDigit: Text;
    // begin

    //     universityusers.Reset;
    //     universityusers.SetRange("Authentication Email", emailaddress);
    //     if universityusers.FindSet then begin
    //         status := 'danger*The User Account with the email address' + ' ' + emailaddress + ' ' + 'already exists.Kindly use the given credentials to login';
    //     end else begin
    //         universityusers."Authentication Email" := emailaddress;
    //         universityusers."Mobile Phone No." := phonenumber;
    //         //UniversityUsers."User Name":=ContactVar."First Name"+'  '+ContactVar.Surname;
    //         universityusers."Record Type" := universityusers."record type"::Vendor;
    //         universityusers."User Name" := emailaddress;
    //         universityusers."Full Name" := universityname;
    //         universityusers."Last Modified Date" := Today;
    //         RandomDigit := CreateGuid;
    //         RandomDigit := DelChr(RandomDigit, '=', '{}-01');
    //         RandomDigit := CopyStr(RandomDigit, 1, 8);
    //         universityusers."Password Value" := RandomDigit;
    //         universityusers.Insert;
    //         SendEmailAcc(universityusers);

    //         status := 'success*The User Account has been created successfully';

    //     end



    //     //SendEmailAccountCreation(emailaddress);
    //     //accountCreationEmailRequest(emailaddress,idnumber);
    //     //FnUseraccountCreationEmailRequest(emailaddress,idnumber);
    //     //  END ELSE BEGIN
    //     //  status:='danger*The User Account has not been created successfully.Kindly try again later';
    //     //  END;

    // end;

    // procedure fnCreateAccreditaionInvoice(docno: Code[30]) status: Text
    // var
    //     AccreditationApplication1: Record "Accreditation Application";
    // begin
    //     AccreditationApplication1.Reset;
    //     AccreditationApplication1.SetRange("Application No.", docno);
    //     if AccreditationApplication1.FindSet then begin
    //         if FILE.Exists(FILESPATH7 + docno + '.pdf') then begin
    //             FILE.Erase(FILESPATH7 + docno + '.pdf');
    //             //Report.SaveAsPdf(51256, FILESPATH7 + docno + '.pdf', AccreditationApplication1);
    //             status := 'success*Generated*Downloads\AccreditationReport\' + docno + '.pdf';
    //         end else begin
    //             //Report.SaveAsPdf(51256, FILESPATH7 + docno + '.pdf', AccreditationApplication1);
    //             status := 'success*Generated*Downloads\AccreditationReport\' + docno + '.pdf';
    //         end
    //     end else begin
    //         status := 'danger*Document not found';
    //     end;
    // end;

    // procedure fnGenerateDeclaration() status: Text
    // var
    //     docno: label 'Declaration';
    // begin
    //     if FILE.Exists(FILESPATH8 + docno + '.pdf') then begin
    //         FILE.Erase(FILESPATH8 + docno + '.pdf');
    //         //Report.SaveAsPdf(51255, FILESPATH8 + docno + '.pdf');
    //         status := 'success*Generated*Downloads\Declaration\' + docno + '.pdf';
    //     end else begin
    //         //Report.SaveAsPdf(51255, FILESPATH8 + docno + '.pdf');
    //         status := 'success*Generated*Downloads\Declaration\' + docno + '.pdf';
    //     end
    // end;
}

