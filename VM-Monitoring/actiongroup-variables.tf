variable "ag-name" {
  description = "The name of the Action Group"
}
variable "ag-smsname" {
  description = "The name of the SMS receiver. Names must be unique (case-insensitive) across all receivers within an action group."
}
variable "ag-phone" {
  description = " The phone number of the SMS receiver."
}

