query 50003 "HR Leave Allocation"
{
    Caption = 'HR Leave Allocation';
    QueryType = Normal;

    elements
    {
        dataitem(HRLeaveAllocationRequest; "HR Leave Allocation Request")
        {
            column(AdjustmentType; "Adjustment Type")
            {
            }
            column(ApplicationType; "Application Type")
            {
            }
            column(AppliedDays; "Applied Days")
            {
            }
            column(ApproverID; "Approver ID")
            {
            }
            column(ApproversComments; "Approvers Comments")
            {
            }
            column(AvaillableDays; "Availlable Days")
            {
            }
            column("Date"; "Date")
            {
            }
            column(DaysApproved; "Days Approved")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(EmployeeDept; "Employee Dept")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(HOD; HOD)
            {
            }
            column(LeaveBalance; "Leave Balance")
            {
            }
            column(LeaveNumber; "Leave Number")
            {
            }
            column(LeaveType; "Leave Type")
            {
            }
            column(No; "No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Posted; Posted)
            {
            }
            column(PostedBy; "Posted By")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(ProcessLeaveAllowance; "Process Leave Allowance")
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(RelieverName; "Reliever Name")
            {
            }
            column(RelieverNo; "Reliever No.")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(ReturnDate; "Return Date")
            {
            }
            column(StartingDate; "Starting Date")
            {
            }
            column(Status; Status)
            {
            }
            column(TimeOffEnd; "Time Off End")
            {
            }
            column(TimeOffStart; "Time Off Start")
            {
            }
            column(UserID; "User ID")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
