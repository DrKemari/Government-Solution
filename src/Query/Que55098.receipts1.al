#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55098 "receipts1"
{

    elements
    {
        dataitem(Receipts_Header1;"Receipts Header1")
        {
            column(No;"No.")
            {
            }
            dataitem(Receipt_Lines1;"Receipt Lines1")
            {
                DataItemLink = "Receipt No."=Receipts_Header1."No.";
                column(Account_No;"Account No.")
                {
                }
            }
        }
    }
}

