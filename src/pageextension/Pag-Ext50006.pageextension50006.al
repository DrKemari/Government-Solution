#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// PageExtension pageextension50006 (ID 50006) extends Record General Ledger Entries.
/// </summary>
#pragma implicitwith disable
PageExtension 50006 "pageextension50006" extends "General Ledger Entries" 
{
    layout
    {
        modify("Document No.")
        {
            Editable = true;
        }

        //Unsupported feature: Property Modification (Visible) on ""Debit Amount"(Control 17)".


        //Unsupported feature: Property Modification (Visible) on ""Credit Amount"(Control 19)".

        addafter(Description)
        {
            field(Name; Rec.Name)
            {
                ApplicationArea = Basic;
            }
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Credit Amount")
        {
            // field("Source No.";"Source No.")
            // {
            //     ApplicationArea = Basic;
            // }
            field("Transaction Type"; Rec."Transaction Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Promoted) on "ReverseTransaction(Action 63)".


        //Unsupported feature: Property Insertion (Visible) on "ReverseTransaction(Action 63)".

    }

    var
        ObjUserSetup: Record "User Setup";


    //Unsupported feature: Code Modification on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CODEUNIT.RUN(CODEUNIT::"G/L Entry-Edit",Rec);
        EXIT(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        {CODEUNIT.RUN(CODEUNIT::"G/L Entry-Edit",Rec);
        EXIT(FALSE);}
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetControlVisibility;

        IF GETFILTERS <> '' THEN
          IF FINDFIRST THEN;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4


        // IF ObjUserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Global Dimension 1 Code",ObjUserSetup."Region Code");
        //  END;
        */
    //end;
}

#pragma implicitwith restore

