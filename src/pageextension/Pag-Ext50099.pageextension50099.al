#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50099 "pageextension50099" extends "Fixed Asset Card" 
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".


        //Unsupported feature: Code Insertion (VariableCollection) on "DepreciationStartingDate(Control 21).OnValidate".

        //trigger (Variable: FASubclass)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on "DepreciationStartingDate(Control 21).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            LoadDepreciationBooks;
            FADepreciationBook.VALIDATE("Depreciation Starting Date");
            SaveSimpleDepriciationBook(xRec."No.");
            ShowAcquireNotification;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            LoadDepreciationBooks;
            FASubclass.RESET;
            FASubclass.SETRANGE(Code,xRec."FA Subclass Code");
            IF FASubclass.FINDFIRST THEN BEGIN
               FADepreciationBook."No. of Depreciation Years":=FASubclass."Depreciation Period";
              FADepreciationBook.MODIFY(TRUE);
            END;
            //FADepreciationBook.VALIDATE("Depreciation Starting Date");
            FADepreciationBook.VALIDATE("No. of Depreciation Years");
            SaveSimpleDepriciationBook(xRec."No.");
            ShowAcquireNotification;
            */
        //end;
        addafter("Serial No.")
        {
            field("Tag No"; Rec."Tag No")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Acquired)
        {
            field("Purchase Date"; Rec."Purchase Date")
            {
                ApplicationArea = Basic;
            }
            field("Asset Type"; Rec."Asset Type")
            {
                ApplicationArea = Basic;
            }
            field("Fixed Asset Type"; Rec."Fixed Asset Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(General)
        {
            group("Research Details")
            {
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        addafter(Insured)
        {
            field(Supplier; Rec.Supplier)
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        FASubclass: Record "FA Subclass";
}

#pragma implicitwith restore

