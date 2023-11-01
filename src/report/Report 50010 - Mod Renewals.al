report 50010 "Mod Renewals"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Mod Renewals.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {

            trigger OnAfterGetRecord()
            var
                NewDate: Date;
            begin
                // MyString:='';
                // TempString:='';
                // String1:='';
                // MyString := "Examination Account"."Registration No.";
                // TempString := CONVERTSTR(MyString,'NCS/','NSC/');
                // String1 := SELECTSTR(1,TempString);
                // IF COPYSTR(MyString,1,4) = 'NCS/' THEN
                // BEGIN
                //
                // ExaminationAccount.TRANSFERFIELDS("Examination Account");
                // ExaminationAccount."Registration No.":=String1;
                // ExaminationAccount.INSERT(TRUE);
                // "Examination Account".DELETE;
                
                
                // END;
                /*
                IF ("Examination Account"."Renewal Pending"<0) THEN BEGIN
                  "Examination Account"."Renewal Amount":=0;
                  "Examination Account".MODIFY;
                  END;
                  */
                  /*
                IF ("Examination Account"."Renewal Pending">3) THEN BEGIN// OR ("Examination Account"."Renewal Pending"=3) ) THEN  BEGIN
                //  THEN BEGIN
                //  Resource.RESET;
                // Resource.SETRANGE("Course ID","Examination Account"."Course ID");
                // IF Resource.FINDSET THEN BEGIN
                //  ResourcePrice.RESET;
                //  ResourcePrice.SETRANGE(Code,Resource."No.");
                //  ResourcePrice.SETRANGE("Document Type",ResourcePrice."Document Type"::"Re-Activation");
                //   IF ResourcePrice.FINDFIRST THEN BEGIN
                //     "Examination Account"."Re-Activation Amount":="Examination Account"."Renewal Pending"*ResourcePrice."Unit Price";
                //       "Examination Account".MODIFY(TRUE);
                //    END
                // END END ELSE
                Resource.RESET;
                Resource.SETRANGE("No.",'CPAREN');
                //Resource.SETRANGE("Course ID","Examination Account"."Course ID");
                IF Resource.FINDSET THEN BEGIN
                  //REPEAT*/
                
                
                /*
                  ResourcePrice.CALCFIELDS(Course);
                  ResourcePrice.RESET;
                  ResourcePrice.SETRANGE(Course,"Examination Account"."Course ID");
                  ResourcePrice.SETRANGE("Currency Code",'');
                  ResourcePrice.SETRANGE("Document Type",ResourcePrice."Document Type"::Renewal);
                   IF ResourcePrice.FINDSET THEN BEGIN
                   //MESSAGE('Hie');
                     IF "Examination Account"."Renewal Pending">=3 THEN BEGIN
                        "Examination Account"."Renewal Amount":=3*ResourcePrice."Unit Price";
                        "Examination Account"."Re-Activation Amount":=0;
                      //  "Examination Account".Status:="Examination Account".Status::Active;
                     END ELSE IF  ("Examination Account"."Renewal Pending">0) AND ("Examination Account"."Renewal Pending"<3) THEN  BEGIN
                       "Examination Account"."Renewal Amount":="Examination Account"."Renewal Pending"*ResourcePrice."Unit Price";
                        "Examination Account"."Re-Activation Amount":=0;
                        // "Examination Account".Status:="Examination Account".Status::Active;
                     END ELSE IF "Examination Account"."Renewal Pending"=0 THEN BEGIN
                       "Examination Account"."Renewal Amount":=0;
                        "Examination Account"."Re-Activation Amount":=0;
                       //  "Examination Account".Status:="Examination Account".Status::Active;
                     END;
                    END;
                    */
                
                /*
                  ResourcePrice.CALCFIELDS(Course);
                  ResourcePrice.RESET;
                  ResourcePrice.SETRANGE(Course,"Examination Account"."Course ID");
                  ResourcePrice.SETRANGE("Currency Code",'');
                  ResourcePrice.SETRANGE("Document Type",ResourcePrice."Document Type"::"Re-Activation");
                   IF ResourcePrice.FINDSET THEN BEGIN
                   //MESSAGE('Hie');
                     IF "Examination Account"."Renewal Pending">3 THEN
                     "Examination Account"."Re-Activation Amount":=ResourcePrice."Unit Price";
                     // "Examination Account".Status:="Examination Account".Status::Dormant;
                
                
                
                    END;
                    //UNTIL Resource.NEXT=0;
                //END
                 "Examination Account".MODIFY(TRUE);
                
                //END
                */
                
                
                // NoRenewal:=0;
                // ExaminationAccount.RESET;
                // ExaminationAccount.SETRANGE("Registration No.","Examination Account"."Registration No.");
                // ExaminationAccount.SETFILTER(Status,'<>%1',ExaminationAccount.Status::Graduate);
                // IF ExaminationAccount.FINDFIRST THEN BEGIN
                //  ExaminationAccount.CALCFIELDS("Renewal Year");
                //  IF ExaminationAccount."Renewal Year"<>0 THEN BEGIN
                //              RenewalBuffer."Registration No.":=ExaminationAccount."Registration No.";
                //
                //              NoRenewal:=(DATE2DMY(TODAY,3)-ExaminationAccount."Renewal Year")+1;
                //              //get rectivation
                // //           IF NoRenewal>3 THEN BEGIN
                // //           RenewalBuffer."Re-Activation Amount":=4000;
                // //           END;
                //
                //              RenewalBuffer."Renewal Pending":=NoRenewal;
                //              //get renewal fee
                //              ResourcePrice.CALCFIELDS(Course);
                //              ResourcePrice.RESET;
                //              ResourcePrice.SETRANGE(Course,"Examination Account"."Course ID");
                //              ResourcePrice.SETRANGE("Currency Code",'');
                //              ResourcePrice.SETRANGE("Document Type",ResourcePrice."Document Type"::Renewal);
                //                IF ResourcePrice.FINDSET THEN BEGIN
                //                  IF (NoRenewal>0)THEN BEGIN
                //                                         IF NoRenewal>3 THEN
                //                                         NoRenewal:=3
                //                                          ELSE
                //                                           NoRenewal:=NoRenewal;
                //                  RenewalBuffer."Renewal Amount":=NoRenewal*ResourcePrice."Unit Price";
                //                 // RenewalBuffer."Renewal Pending":=NoRenewal;
                //
                //                  END;
                //                 END;
                // RenewalBuffer.INSERT(TRUE);
                //
                // END
                // END;
                //
                
                
                //machira
                // /   //
                // // //GET REACTIVATION
                // //
                // // //get reactivation
                // NoRenewal1:=(DATE2DMY(TODAY,3)-ExaminationAccount."Renewal Year")+1;
                //  ResourcePrice.RESET;
                //  ResourcePrice.SETRANGE(Course,"Examination Account"."Course ID");
                //  ResourcePrice.SETRANGE("Currency Code",'');
                //  ResourcePrice.SETRANGE("Document Type",ResourcePrice."Document Type"::"Re-Activation");
                //   IF ResourcePrice.FINDSET THEN BEGIN
                //    IF NoRenewal1>3 THEN BEGIN
                //
                //       RenewalBuffer."Re-Activation Amount":=ResourcePrice."Unit Price";
                //       END;
                //   END;
                //end machira
                
                
                 /*
                 IF "Examination Account"."Last Renewal Date"<>0D THEN BEGIN
                 NewDate:=CALCDATE('+4Y',"Examination Account"."Last Renewal Date");
                    IF NewDate<TODAY THEN BEGIN
                    "Examination Account".Status:="Examination Account".Status::Dormant;
                      "Examination Account"."Renewal Pending":=3;
                       "Examination Account".MODIFY(TRUE);
                    END
                 END;
                */
                
                /*
                IF "Examination Account"."Renewal Pending"<0 THEN BEGIN
                    "Examination Account"."Renewal Pending":=0;
                       "Examination Account".MODIFY(TRUE);
                 END;
                
                */
                
                
                /*
                IF ("Examination Account"."Renewal Pending">3) THEN BEGIN
                       "Examination Account".Status:="Examination Account".Status::Dormant;
                       "Examination Account".MODIFY(TRUE);
                 END;
                */
                
                /*
                IF "Examination Account"."Renewal Pending"<0 THEN BEGIN
                    "Examination Account"."Renewal Pending":=0;
                       "Examination Account".MODIFY(TRUE);
                 END;
                */
                ExamAccount.ApplicationAssignRegistrationNo("Student Processing Header");
                //ExamAccount.ExemptionCreateInvoice("Student Processing Header");

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Deduction: Record DeductionsX;
        Courses: Record Courses;
        RenewalBuffer: Record "Renewal Buffer";
        Customer: Record Customer;
        AccountNo: Code[50];
        MyString: Text;
        TempString: Text;
        String1: Text;
        String2: Text;
        Duration: Integer;
        NoOfYEars: Integer;
        RenewalEntries: Record "Student Renewal Entries";
        ResourcePrice: Record "Resource Price";
        Resource: Record Resource;
        ExaminationAccount: Record "Examination Account";
        NoRenewal: Integer;
        NoRenewal1: Integer;
        ResourcePrice1: Record "Resource Price";
        ExamAccount: Codeunit Examination;
}

