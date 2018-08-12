module IPhreeqc

if is_windows()
    error("No binary files for your OS. Only Linux at the moment!")
  # const Lib_IPhreeqc_path=joinpath(Pkg.dir(), "JPhreeqc", "deps", "IPhreeqc.dll")
elseif is_linux()
  const Lib_IPhreeqc_path=joinpath("/usr/local/lib", "libiphreeqc.so")
else
  error("No binary files for your OS. Only Windows and Linux at the moment!")
end

VRESULT = Cint
IPQ_RESULT = Cint
VAR = Union{Clong, Cint, Cdouble, Cstring}

function VarAllocString(pSrc)
    ccall((:VarAllocString, Lib_IPhreeqc_path), Cstring, (Cstring,), pSrc)
end

function VarClear(pvar)
    ccall((:VarClear, Lib_IPhreeqc_path), VRESULT, (Ptr{VAR},), pvar)
end

function VarCopy(pvarDest, pvarSrc)
    ccall((:VarCopy, Lib_IPhreeqc_path), VRESULT, (Ptr{VAR}, Ptr{VAR}), pvarDest, pvarSrc)
end

function VarFreeString(pSrc)
    ccall((:VarFreeString, Lib_IPhreeqc_path), Void, (Cstring,), pSrc)
end

function VarInit(pvar)
    ccall((:VarInit, Lib_IPhreeqc_path), Void, (Ptr{VAR},), pvar)
end

function AccumulateLine(id::Cint, line::AbstractString)
    # ccall((:AccumulateLine, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, line)
    IPQ_RESULT = ccall((:AccumulateLine, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, line)
end

function AddError(id::Cint, error_msg)
    ccall((:AddError, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, error_msg)
end

function AddWarning(id::Cint, warn_msg)
    ccall((:AddWarning, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, warn_msg)
end

function ClearAccumulatedLines(id::Cint)
    ccall((:ClearAccumulatedLines, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function CreateIPhreeqc()
    ccall((:CreateIPhreeqc, Lib_IPhreeqc_path), Cint, ())
end

function DestroyIPhreeqc(id::Cint)
    ccall((:DestroyIPhreeqc, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function GetComponent(id::Cint, n::Cint)
    ccall((:GetComponent, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetComponentCount(id::Cint)
    ccall((:GetComponentCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetCurrentSelectedOutputUserNumber(id::Cint)
    ccall((:GetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpFileName(id::Cint)
    ccall((:GetDumpFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpFileOn(id::Cint)
    ccall((:GetDumpFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpString(id::Cint)
    ccall((:GetDumpString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpStringLine(id::Cint, n::Cint)
    ccall((:GetDumpStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetDumpStringLineCount(id::Cint)
    ccall((:GetDumpStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpStringOn(id::Cint)
    ccall((:GetDumpStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorFileName(id::Cint)
    ccall((:GetErrorFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorFileOn(id::Cint)
    ccall((:GetErrorFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorString(id::Cint)
    ccall((:GetErrorString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorStringLine(id::Cint, n::Cint)
    ccall((:GetErrorStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetErrorStringLineCount(id::Cint)
    ccall((:GetErrorStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorStringOn(id::Cint)
    ccall((:GetErrorStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogFileName(id::Cint)
    ccall((:GetLogFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogFileOn(id::Cint)
    ccall((:GetLogFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogString(id::Cint)
    ccall((:GetLogString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogStringLine(id::Cint, n::Cint)
    ccall((:GetLogStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetLogStringLineCount(id::Cint)
    ccall((:GetLogStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogStringOn(id::Cint)
    ccall((:GetLogStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetNthSelectedOutputUserNumber(id::Cint, n::Cint)
    ccall((:GetNthSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint, Cint), id, n)
end

function GetOutputFileName(id::Cint)
    ccall((:GetOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetOutputFileOn(id::Cint)
    ccall((:GetOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputString(id::Cint)
    ccall((:GetOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetOutputStringLine(id::Cint, n::Cint)
    ccall((:GetOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetOutputStringLineCount(id::Cint)
    ccall((:GetOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputStringOn(id::Cint)
    ccall((:GetOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputColumnCount(id::Cint)
    ccall((:GetSelectedOutputColumnCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputCount(id::Cint)
    ccall((:GetSelectedOutputCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputFileName(id::Cint)
    ccall((:GetSelectedOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputFileOn(id::Cint)
    ccall((:GetSelectedOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputRowCount(id::Cint)
    ccall((:GetSelectedOutputRowCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputString(id::Cint)
    ccall((:GetSelectedOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputStringLine(id::Cint, n::Cint)
    ccall((:GetSelectedOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetSelectedOutputStringLineCount(id::Cint)
    ccall((:GetSelectedOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputStringOn(id::Cint)
    ccall((:GetSelectedOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputValue(id::Cint, row::Cint, col::Cint, pVAR)
    ccall((:GetSelectedOutputValue, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{VAR}), id, row, col, pVAR)
end

function GetSelectedOutputValue2(id::Cint, row::Cint, col::Cint, vtype, dvalue, svalue, svalue_length::UInt32)
    ccall((:GetSelectedOutputValue2, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Cstring, UInt32), id, row, col, vtype, dvalue, svalue, svalue_length)
end

function GetVersionString()
    ccall((:GetVersionString, Lib_IPhreeqc_path), Cstring, ())
end

function GetWarningString(id::Cint)
    ccall((:GetWarningString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetWarningStringLine(id::Cint, n::Cint)
    ccall((:GetWarningStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetWarningStringLineCount(id::Cint)
    ccall((:GetWarningStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function LoadDatabase(id::Cint, filename)
    ccall((:LoadDatabase, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function LoadDatabaseString(id::Cint, input)
    ccall((:LoadDatabaseString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function OutputAccumulatedLines(id::Cint)
    ccall((:OutputAccumulatedLines, Lib_IPhreeqc_path), Void, (Cint,), id)
end

function OutputErrorString(id::Cint)
    ccall((:OutputErrorString, Lib_IPhreeqc_path), Void, (Cint,), id)
end

function OutputWarningString(id::Cint)
    ccall((:OutputWarningString, Lib_IPhreeqc_path), Void, (Cint,), id)
end

function RunAccumulated(id::Cint)
    ccall((:RunAccumulated, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function RunFile(id::Cint, filename)
    ccall((:RunFile, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function RunString(id::Cint, input)
    ccall((:RunString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function SetBasicCallback(id::Cint, fcn, cookie1)
    ccall((:SetBasicCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Void}, Ptr{Void}), id, fcn, cookie1)
end

function SetBasicFortranCallback(id::Cint, fcn)
    ccall((:SetBasicFortranCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Void}), id, fcn)
end

function SetCurrentSelectedOutputUserNumber(id::Cint, n::Cint)
    ccall((:SetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, n)
end

function SetDumpFileName(id::Cint, filename)
    ccall((:SetDumpFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetDumpFileOn(id::Cint, dump_on::Cint)
    ccall((:SetDumpFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_on)
end

function SetDumpStringOn(id::Cint, dump_string_on::Cint)
    ccall((:SetDumpStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_string_on)
end

function SetErrorFileName(id::Cint, filename)
    ccall((:SetErrorFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetErrorFileOn(id::Cint, error_on::Cint)
    ccall((:SetErrorFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_on)
end

function SetErrorStringOn(id::Cint, error_string_on::Cint)
    ccall((:SetErrorStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_string_on)
end

function SetLogFileName(id::Cint, filename)
    ccall((:SetLogFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetLogFileOn(id::Cint, log_on::Cint)
    ccall((:SetLogFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_on)
end

function SetLogStringOn(id::Cint, log_string_on::Cint)
    ccall((:SetLogStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_string_on)
end

function SetOutputFileName(id::Cint, filename)
    ccall((:SetOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetOutputFileOn(id::Cint, output_on::Cint)
    ccall((:SetOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_on)
end

function SetOutputStringOn(id::Cint, output_string_on::Cint)
    ccall((:SetOutputStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_string_on)
end

function SetSelectedOutputFileName(id::Cint, filename)
    ccall((:SetSelectedOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetSelectedOutputFileOn(id::Cint, sel_on::Cint)
    ccall((:SetSelectedOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, sel_on)
end

function SetSelectedOutputStringOn(id::Cint, sel_string_on::Cint)
    ccall((:SetSelectedOutputStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, sel_string_on)
end

function VarAllocString(pSrc)
    ccall((:VarAllocString, Lib_IPhreeqc_path), Cstring, (Cstring,), pSrc)
end

function VarClear(pvar)
    ccall((:VarClear, Lib_IPhreeqc_path), VRESULT, (Ptr{VAR},), pvar)
end

function VarCopy(pvarDest, pvarSrc)
    ccall((:VarCopy, Lib_IPhreeqc_path), VRESULT, (Ptr{VAR}, Ptr{VAR}), pvarDest, pvarSrc)
end

function VarFreeString(pSrc)
    ccall((:VarFreeString, Lib_IPhreeqc_path), Void, (Cstring,), pSrc)
end

function VarInit(pvar)
    ccall((:VarInit, Lib_IPhreeqc_path), Void, (Ptr{VAR},), pvar)
end

function AccumulateLine(id::Cint, line)
    ccall((:AccumulateLine, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, line)
end

function AddError(id::Cint, error_msg)
    ccall((:AddError, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, error_msg)
end

function AddWarning(id::Cint, warn_msg)
    ccall((:AddWarning, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, warn_msg)
end

function ClearAccumulatedLines(id::Cint)
    ccall((:ClearAccumulatedLines, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function CreateIPhreeqc()
    ccall((:CreateIPhreeqc, Lib_IPhreeqc_path), Cint, ())
end

function DestroyIPhreeqc(id::Cint)
    ccall((:DestroyIPhreeqc, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function GetComponent(id::Cint, n::Cint)
    ccall((:GetComponent, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetComponentCount(id::Cint)
    ccall((:GetComponentCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetCurrentSelectedOutputUserNumber(id::Cint)
    ccall((:GetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpFileName(id::Cint)
    ccall((:GetDumpFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpFileOn(id::Cint)
    ccall((:GetDumpFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpString(id::Cint)
    ccall((:GetDumpString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpStringLine(id::Cint, n::Cint)
    ccall((:GetDumpStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetDumpStringLineCount(id::Cint)
    ccall((:GetDumpStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpStringOn(id::Cint)
    ccall((:GetDumpStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorFileName(id::Cint)
    ccall((:GetErrorFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorFileOn(id::Cint)
    ccall((:GetErrorFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorString(id::Cint)
    ccall((:GetErrorString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorStringLine(id::Cint, n::Cint)
    ccall((:GetErrorStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetErrorStringLineCount(id::Cint)
    ccall((:GetErrorStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorStringOn(id::Cint)
    ccall((:GetErrorStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogFileName(id::Cint)
    ccall((:GetLogFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogFileOn(id::Cint)
    ccall((:GetLogFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogString(id::Cint)
    ccall((:GetLogString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogStringLine(id::Cint, n::Cint)
    ccall((:GetLogStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetLogStringLineCount(id::Cint)
    ccall((:GetLogStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogStringOn(id::Cint)
    ccall((:GetLogStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetNthSelectedOutputUserNumber(id::Cint, n::Cint)
    ccall((:GetNthSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint, Cint), id, n)
end

function GetOutputFileName(id::Cint)
    ccall((:GetOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetOutputFileOn(id::Cint)
    ccall((:GetOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputString(id::Cint)
    ccall((:GetOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetOutputStringLine(id::Cint, n::Cint)
    ccall((:GetOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetOutputStringLineCount(id::Cint)
    ccall((:GetOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputStringOn(id::Cint)
    ccall((:GetOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputColumnCount(id::Cint)
    ccall((:GetSelectedOutputColumnCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputCount(id::Cint)
    ccall((:GetSelectedOutputCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputFileName(id::Cint)
    ccall((:GetSelectedOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputFileOn(id::Cint)
    ccall((:GetSelectedOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputRowCount(id::Cint)
    ccall((:GetSelectedOutputRowCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputString(id::Cint)
    ccall((:GetSelectedOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputStringLine(id::Cint, n::Cint)
    ccall((:GetSelectedOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetSelectedOutputStringLineCount(id::Cint)
    ccall((:GetSelectedOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputStringOn(id::Cint)
    ccall((:GetSelectedOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputValue(id::Cint, row::Cint, col::Cint, pVAR)
    ccall((:GetSelectedOutputValue, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{VAR}), id, row, col, pVAR)
end

function GetSelectedOutputValue2(id::Cint, row::Cint, col::Cint, vtype, dvalue, svalue, svalue_length::UInt32)
    ccall((:GetSelectedOutputValue2, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Cstring, UInt32), id, row, col, vtype, dvalue, svalue, svalue_length)
end

function GetVersionString()
    ccall((:GetVersionString, Lib_IPhreeqc_path), Cstring, ())
end

function GetWarningString(id::Cint)
    ccall((:GetWarningString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetWarningStringLine(id::Cint, n::Cint)
    ccall((:GetWarningStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetWarningStringLineCount(id::Cint)
    ccall((:GetWarningStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function LoadDatabase(id::Cint, filename)
    ccall((:LoadDatabase, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function LoadDatabaseString(id::Cint, input)
    ccall((:LoadDatabaseString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function OutputAccumulatedLines(id::Cint)
    ccall((:OutputAccumulatedLines, Lib_IPhreeqc_path), Void, (Cint,), id)
end

function OutputErrorString(id::Cint)
    ccall((:OutputErrorString, Lib_IPhreeqc_path), Void, (Cint,), id)
end

function OutputWarningString(id::Cint)
    ccall((:OutputWarningString, Lib_IPhreeqc_path), Void, (Cint,), id)
end

function RunAccumulated(id::Cint)
    ccall((:RunAccumulated, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function RunFile(id::Cint, filename)
    ccall((:RunFile, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function RunString(id::Cint, input)
    ccall((:RunString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function SetBasicCallback(id::Cint, fcn, cookie1)
    ccall((:SetBasicCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Void}, Ptr{Void}), id, fcn, cookie1)
end

function SetBasicFortranCallback(id::Cint, fcn)
    ccall((:SetBasicFortranCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Void}), id, fcn)
end

function SetCurrentSelectedOutputUserNumber(id::Cint, n::Cint)
    ccall((:SetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, n)
end

function SetDumpFileName(id::Cint, filename)
    ccall((:SetDumpFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetDumpFileOn(id::Cint, dump_on::Cint)
    ccall((:SetDumpFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_on)
end

function SetDumpStringOn(id::Cint, dump_string_on::Cint)
    ccall((:SetDumpStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_string_on)
end

function SetErrorFileName(id::Cint, filename)
    ccall((:SetErrorFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetErrorFileOn(id::Cint, error_on::Cint)
    ccall((:SetErrorFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_on)
end

function SetErrorStringOn(id::Cint, error_string_on::Cint)
    ccall((:SetErrorStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_string_on)
end

function SetLogFileName(id::Cint, filename)
    ccall((:SetLogFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetLogFileOn(id::Cint, log_on::Cint)
    ccall((:SetLogFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_on)
end

function SetLogStringOn(id::Cint, log_string_on::Cint)
    ccall((:SetLogStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_string_on)
end

function SetOutputFileName(id::Cint, filename)
    ccall((:SetOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetOutputFileOn(id::Cint, output_on::Cint)
    ccall((:SetOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_on)
end

function SetOutputStringOn(id::Cint, output_string_on::Cint)
    ccall((:SetOutputStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_string_on)
end

function SetSelectedOutputFileName(id::Cint, filename)
    ccall((:SetSelectedOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetSelectedOutputFileOn(id::Cint, sel_on::Cint)
    ccall((:SetSelectedOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, sel_on)
end

function SetSelectedOutputStringOn(id::Cint, sel_string_on::Cint)
    ccall((:SetSelectedOutputStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, sel_string_on)
end
# Julia wrapper for header: Var.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function VarAllocString(pSrc)
    ccall((:VarAllocString, Lib_IPhreeqc_path), Cstring, (Cstring,), pSrc)
end

function VarClear(pvar)
    ccall((:VarClear, Lib_IPhreeqc_path), VRESULT, (Ptr{VAR},), pvar)
end

function VarCopy(pvarDest, pvarSrc)
    ccall((:VarCopy, Lib_IPhreeqc_path), VRESULT, (Ptr{VAR}, Ptr{VAR}), pvarDest, pvarSrc)
end

function VarFreeString(pSrc)
    ccall((:VarFreeString, Lib_IPhreeqc_path), Void, (Cstring,), pSrc)
end

function VarInit(pvar)
    ccall((:VarInit, Lib_IPhreeqc_path), Void, (Ptr{VAR},), pvar)
end

end # module
