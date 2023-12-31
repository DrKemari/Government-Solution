#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55069 "RecruitmentCandidates"
{

    elements
    {
        dataitem(Dynasoft_Portal_User;"Dynasoft Portal User")
        {
            column(Entry_No;"Entry No")
            {
            }
            column(User_Name;"User Name")
            {
            }
            column(Full_Name;"Full Name")
            {
            }
            column(Authentication_Email;"Authentication Email")
            {
            }
            column(Mobile_Phone_No;"Mobile Phone No.")
            {
            }
            column(State;State)
            {
            }
            column(Change_Password;"Change Password")
            {
            }
            column(Record_Type;"Record Type")
            {
            }
            column(Record_ID;"Record ID")
            {
            }
            column(Password_Value;"Password Value")
            {
            }
            column(Last_Modified_Date;"Last Modified Date")
            {
            }
            dataitem(Applicant;Applicant)
            {
                DataItemLink = "E-Mail"=Dynasoft_Portal_User."Authentication Email";
                column(Candidate_No;"Candidate No.")
                {
                }
                column(First_Name;"First Name")
                {
                }
                column(Middle_Name;"Middle Name")
                {
                }
                column(Last_Name;"Last Name")
                {
                }
                column(Full_Names;"Full Names")
                {
                }
                column(Address;Address)
                {
                }
                column(Address_2;"Address 2")
                {
                }
                column(City;City)
                {
                }
                column(Post_Code;"Post Code")
                {
                }
                column(County_of_Birth;"County of Birth")
                {
                }
                column(Phone_No;"Phone No.")
                {
                }
                column(E_Mail;"E-Mail")
                {
                }
                column(Birth_Date;"Birth Date")
                {
                }
                column(Gender;Gender)
                {
                }
                column(Country_Region_Code;"Country/Region Code")
                {
                }
                column(ID_Number;"ID Number")
                {
                }
                column(Passport_No;"Passport No.")
                {
                }
                column(Marital_Status;"Marital Status")
                {
                }
                column(Religion;Religion)
                {
                }
                column(Ethnic_Group;"Ethnic Group")
                {
                }
                column(Nationality;Nationality)
                {
                }
                column(Specialization_Area;"Specialization Area")
                {
                }
                column(Highest_Academic_Qualification;"Highest Academic Qualification")
                {
                }
                column(Qualification_Name;"Qualification Name")
                {
                }
                column(Work_Experience_Years;"Work Experience (Years)")
                {
                }
                column(Management_Experience_Years;"Management Experience (Years)")
                {
                }
                column(Disability_Code;"Disability Code")
                {
                }
                column(Disabled;Disabled)
                {
                }
                column(Disability_Description;"Disability Description")
                {
                }
                column(Disability_Certificate_No;"Disability Certificate No")
                {
                }
                column(Status;Status)
                {
                }
                column(Inactive_Date;"Inactive Date")
                {
                }
                column(Cause_of_Inactivity_Code;"Cause of Inactivity Code")
                {
                }
                column(Termination_Date;"Termination Date")
                {
                }
                column(Grounds_for_Term_Code;"Grounds for Term. Code")
                {
                }
                column(Last_Date_Modified;"Last Date Modified")
                {
                }
                column(Last_Modified_Date_Time;"Last Modified Date Time")
                {
                }
                column(No_of_Job_Applications;"No. of Job Applications")
                {
                }
                column(Skills_Competences;"Skills & Competences")
                {
                }
            }
        }
    }
}

