module IPhreeqc

if Sys.iswindows()
    const Lib_IPhreeqc_path=joinpath(@__DIR__, "..", "lib", "libiphreeqc.dll")
elseif Sys.islinux()
    const Lib_IPhreeqc_path=joinpath(@__DIR__, "..", "lib", "libiphreeqc.so")
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
    ccall((:VarFreeString, Lib_IPhreeqc_path), Nothing, (Cstring,), pSrc)
end

function VarInit(pvar)
    ccall((:VarInit, Lib_IPhreeqc_path), Nothing, (Ptr{VAR},), pvar)
end

function AccumulateLine(id::Int, line::AbstractString)
    # ccall((:AccumulateLine, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, line)
    IPQ_RESULT = ccall((:AccumulateLine, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, line)
end

function AddError(id::Int, error_msg)
    ccall((:AddError, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, error_msg)
end

function AddWarning(id::Int, warn_msg)
    ccall((:AddWarning, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, warn_msg)
end

function ClearAccumulatedLines(id::Int)
    ccall((:ClearAccumulatedLines, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function CreateIPhreeqc()
    id = ccall((:CreateIPhreeqc, Lib_IPhreeqc_path), Cint, ())
    id = convert(Int, id)
    return id
end

function DestroyIPhreeqc(id::Int)
    ccall((:DestroyIPhreeqc, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function GetComponent(id::Int, n::Int)
    ccall((:GetComponent, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetComponentCount(id::Int)
    n_components = ccall((:GetComponentCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
    return convert(Int, n_components)
end

function GetCurrentSelectedOutputUserNumber(id::Int)
    ccall((:GetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpFileName(id::Int)
    ccall((:GetDumpFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpFileOn(id::Int)
    ccall((:GetDumpFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpString(id::Int)
    ccall((:GetDumpString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpStringLine(id::Int, n::Int)
    ccall((:GetDumpStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetDumpStringLineCount(id::Int)
    ccall((:GetDumpStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpStringOn(id::Int)
    ccall((:GetDumpStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorFileName(id::Int)
    ccall((:GetErrorFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorFileOn(id::Int)
    ccall((:GetErrorFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorString(id::Int)
    ccall((:GetErrorString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorStringLine(id::Int, n::Int)
    ccall((:GetErrorStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetErrorStringLineCount(id::Int)
    ccall((:GetErrorStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorStringOn(id::Int)
    ccall((:GetErrorStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogFileName(id::Int)
    ccall((:GetLogFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogFileOn(id::Int)
    ccall((:GetLogFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogString(id::Int)
    ccall((:GetLogString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogStringLine(id::Int, n::Int)
    ccall((:GetLogStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetLogStringLineCount(id::Int)
    ccall((:GetLogStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogStringOn(id::Int)
    ccall((:GetLogStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetNthSelectedOutputUserNumber(id::Int, n::Int)
    ccall((:GetNthSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint, Cint), id, n)
end

function GetOutputFileName(id::Int)
    ccall((:GetOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetOutputFileOn(id::Int)
    ccall((:GetOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputString(id::Int)
    res = ccall((:GetOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
    return unsafe_string(res)
end

function GetOutputStringLine(id::Int, n::Int)
    res = ccall((:GetOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
    return unsafe_string(res)
end

function GetOutputStringLineCount(id::Int)
    ccall((:GetOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputStringOn(id::Int)
    ccall((:GetOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputColumnCount(id::Int)
    ccall((:GetSelectedOutputColumnCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputCount(id::Int)
    ccall((:GetSelectedOutputCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputFileName(id::Int)
    ccall((:GetSelectedOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputFileOn(id::Int)
    ccall((:GetSelectedOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputRowCount(id::Int)
    ccall((:GetSelectedOutputRowCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputString(id::Int)
    ccall((:GetSelectedOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputStringLine(id::Int, n::Int)
    ccall((:GetSelectedOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetSelectedOutputStringLineCount(id::Int)
    ccall((:GetSelectedOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputStringOn(id::Int)
    ccall((:GetSelectedOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputValue(id::Int, row::Int, col::Int, pVAR)
    ccall((:GetSelectedOutputValue, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{VAR}), id, row, col, pVAR)
end

function GetSelectedOutputValue2(id::Int, row::Int, col::Int, vtype, dvalue, svalue, svalue_length::UInt32)
    ccall((:GetSelectedOutputValue2, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Cstring, UInt32), id, row, col, vtype, dvalue, svalue, svalue_length)
end

function GetVersionString()
    ccall((:GetVersionString, Lib_IPhreeqc_path), Cstring, ())
end

function GetWarningString(id::Int)
    ccall((:GetWarningString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetWarningStringLine(id::Int, n::Int)
    ccall((:GetWarningStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetWarningStringLineCount(id::Int)
    ccall((:GetWarningStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function LoadDatabase(id::Int, filename)
    ccall((:LoadDatabase, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function LoadDatabaseString(id::Int, input)
    ccall((:LoadDatabaseString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function OutputAccumulatedLines(id::Int)
    ccall((:OutputAccumulatedLines, Lib_IPhreeqc_path), Nothing, (Cint,), id)
end

function OutputErrorString(id::Int)
    ccall((:OutputErrorString, Lib_IPhreeqc_path), Nothing, (Cint,), id)
end

function OutputWarningString(id::Int)
    ccall((:OutputWarningString, Lib_IPhreeqc_path), Nothing, (Cint,), id)
end

function RunAccumulated(id::Int)
    ccall((:RunAccumulated, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function RunFile(id::Int, filename)
    ccall((:RunFile, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function RunString(id::Int, input)
    ccall((:RunString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function SetBasicCallback(id::Int, fcn, cookie1)
    ccall((:SetBasicCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Nothing}, Ptr{Nothing}), id, fcn, cookie1)
end

function SetBasicFortranCallback(id::Int, fcn)
    ccall((:SetBasicFortranCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Nothing}), id, fcn)
end

function SetCurrentSelectedOutputUserNumber(id::Int, n::Int)
    ccall((:SetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, n)
end

function SetDumpFileName(id::Int, filename)
    ccall((:SetDumpFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetDumpFileOn(id::Int, dump_on::Int)
    ccall((:SetDumpFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_on)
end

function SetDumpStringOn(id::Int, dump_string_on::Int)
    ccall((:SetDumpStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_string_on)
end

function SetErrorFileName(id::Int, filename)
    ccall((:SetErrorFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetErrorFileOn(id::Int, error_on::Int)
    ccall((:SetErrorFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_on)
end

function SetErrorStringOn(id::Int, error_string_on::Int)
    ccall((:SetErrorStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_string_on)
end

function SetLogFileName(id::Int, filename)
    ccall((:SetLogFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetLogFileOn(id::Int, log_on::Int)
    ccall((:SetLogFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_on)
end

function SetLogStringOn(id::Int, log_string_on::Int)
    ccall((:SetLogStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_string_on)
end

function SetOutputFileName(id::Int, filename)
    ccall((:SetOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetOutputFileOn(id::Int, output_on::Int)
    ccall((:SetOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_on)
end

function SetOutputStringOn(id::Int, output_string_on::Int)
    ccall((:SetOutputStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_string_on)
end

function SetSelectedOutputFileName(id::Int, filename)
    ccall((:SetSelectedOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetSelectedOutputFileOn(id::Int, sel_on::Int)
    ccall((:SetSelectedOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, sel_on)
end

function SetSelectedOutputStringOn(id::Int, sel_string_on::Int)
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
    ccall((:VarFreeString, Lib_IPhreeqc_path), Nothing, (Cstring,), pSrc)
end

function VarInit(pvar)
    ccall((:VarInit, Lib_IPhreeqc_path), Nothing, (Ptr{VAR},), pvar)
end

function AccumulateLine(id::Int, line)
    ccall((:AccumulateLine, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, line)
end

function AddError(id::Int, error_msg)
    ccall((:AddError, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, error_msg)
end

function AddWarning(id::Int, warn_msg)
    ccall((:AddWarning, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, warn_msg)
end

function ClearAccumulatedLines(id::Int)
    ccall((:ClearAccumulatedLines, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function CreateIPhreeqc()
    ccall((:CreateIPhreeqc, Lib_IPhreeqc_path), Cint, ())
end

function DestroyIPhreeqc(id::Int)
    ccall((:DestroyIPhreeqc, Lib_IPhreeqc_path), IPQ_RESULT, (Cint,), id)
end

function GetComponent(id::Int, n::Int)
    ccall((:GetComponent, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetComponentCount(id::Int)
    ccall((:GetComponentCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetCurrentSelectedOutputUserNumber(id::Int)
    ccall((:GetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpFileName(id::Int)
    ccall((:GetDumpFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpFileOn(id::Int)
    ccall((:GetDumpFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpString(id::Int)
    ccall((:GetDumpString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetDumpStringLine(id::Int, n::Int)
    ccall((:GetDumpStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetDumpStringLineCount(id::Int)
    ccall((:GetDumpStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetDumpStringOn(id::Int)
    ccall((:GetDumpStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorFileName(id::Int)
    ccall((:GetErrorFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorFileOn(id::Int)
    ccall((:GetErrorFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorString(id::Int)
    ccall((:GetErrorString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetErrorStringLine(id::Int, n::Int)
    ccall((:GetErrorStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetErrorStringLineCount(id::Int)
    ccall((:GetErrorStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetErrorStringOn(id::Int)
    ccall((:GetErrorStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogFileName(id::Int)
    ccall((:GetLogFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogFileOn(id::Int)
    ccall((:GetLogFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogString(id::Int)
    ccall((:GetLogString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetLogStringLine(id::Int, n::Int)
    ccall((:GetLogStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetLogStringLineCount(id::Int)
    ccall((:GetLogStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetLogStringOn(id::Int)
    ccall((:GetLogStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetNthSelectedOutputUserNumber(id::Int, n::Int)
    ccall((:GetNthSelectedOutputUserNumber, Lib_IPhreeqc_path), Cint, (Cint, Cint), id, n)
end

function GetOutputFileName(id::Int)
    ccall((:GetOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetOutputFileOn(id::Int)
    ccall((:GetOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputString(id::Int)
    ccall((:GetOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetOutputStringLine(id::Int, n::Int)
    ccall((:GetOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetOutputStringLineCount(id::Int)
    ccall((:GetOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetOutputStringOn(id::Int)
    ccall((:GetOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputColumnCount(id::Int)
    ccall((:GetSelectedOutputColumnCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputCount(id::Int)
    ccall((:GetSelectedOutputCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputFileName(id::Int)
    ccall((:GetSelectedOutputFileName, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputFileOn(id::Int)
    ccall((:GetSelectedOutputFileOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputRowCount(id::Int)
    ccall((:GetSelectedOutputRowCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputString(id::Int)
    ccall((:GetSelectedOutputString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetSelectedOutputStringLine(id::Int, n::Int)
    ccall((:GetSelectedOutputStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetSelectedOutputStringLineCount(id::Int)
    ccall((:GetSelectedOutputStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputStringOn(id::Int)
    ccall((:GetSelectedOutputStringOn, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function GetSelectedOutputValue(id::Int, row::Int, col::Int, pVAR)
    ccall((:GetSelectedOutputValue, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{VAR}), id, row, col, pVAR)
end

function GetSelectedOutputValue2(id::Int, row::Int, col::Int, vtype, dvalue, svalue, svalue_length::UInt32)
    ccall((:GetSelectedOutputValue2, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Cstring, UInt32), id, row, col, vtype, dvalue, svalue, svalue_length)
end

function GetVersionString()
    ccall((:GetVersionString, Lib_IPhreeqc_path), Cstring, ())
end

function GetWarningString(id::Int)
    ccall((:GetWarningString, Lib_IPhreeqc_path), Cstring, (Cint,), id)
end

function GetWarningStringLine(id::Int, n::Int)
    ccall((:GetWarningStringLine, Lib_IPhreeqc_path), Cstring, (Cint, Cint), id, n)
end

function GetWarningStringLineCount(id::Int)
    ccall((:GetWarningStringLineCount, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function LoadDatabase(id::Int, filename)
    ccall((:LoadDatabase, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function LoadDatabaseString(id::Int, input)
    ccall((:LoadDatabaseString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function OutputAccumulatedLines(id::Int)
    ccall((:OutputAccumulatedLines, Lib_IPhreeqc_path), Nothing, (Cint,), id)
end

function OutputErrorString(id::Int)
    ccall((:OutputErrorString, Lib_IPhreeqc_path), Nothing, (Cint,), id)
end

function OutputWarningString(id::Int)
    ccall((:OutputWarningString, Lib_IPhreeqc_path), Nothing, (Cint,), id)
end

function RunAccumulated(id::Int)
    ccall((:RunAccumulated, Lib_IPhreeqc_path), Cint, (Cint,), id)
end

function RunFile(id::Int, filename)
    ccall((:RunFile, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, filename)
end

function RunString(id::Int, input)
    ccall((:RunString, Lib_IPhreeqc_path), Cint, (Cint, Cstring), id, input)
end

function SetBasicCallback(id::Int, fcn, cookie1)
    ccall((:SetBasicCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Nothing}, Ptr{Nothing}), id, fcn, cookie1)
end

function SetBasicFortranCallback(id::Int, fcn)
    ccall((:SetBasicFortranCallback, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Ptr{Nothing}), id, fcn)
end

function SetCurrentSelectedOutputUserNumber(id::Int, n::Int)
    ccall((:SetCurrentSelectedOutputUserNumber, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, n)
end

function SetDumpFileName(id::Int, filename)
    ccall((:SetDumpFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetDumpFileOn(id::Int, dump_on::Int)
    ccall((:SetDumpFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_on)
end

function SetDumpStringOn(id::Int, dump_string_on::Int)
    ccall((:SetDumpStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, dump_string_on)
end

function SetErrorFileName(id::Int, filename)
    ccall((:SetErrorFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetErrorFileOn(id::Int, error_on::Int)
    ccall((:SetErrorFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_on)
end

function SetErrorStringOn(id::Int, error_string_on::Int)
    ccall((:SetErrorStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, error_string_on)
end

function SetLogFileName(id::Int, filename)
    ccall((:SetLogFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetLogFileOn(id::Int, log_on::Int)
    ccall((:SetLogFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_on)
end

function SetLogStringOn(id::Int, log_string_on::Int)
    ccall((:SetLogStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, log_string_on)
end

function SetOutputFileName(id::Int, filename)
    ccall((:SetOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetOutputFileOn(id::Int, output_on::Int)
    ccall((:SetOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_on)
end

function SetOutputStringOn(id::Int, output_string_on::Int)
    ccall((:SetOutputStringOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, output_string_on)
end

function SetSelectedOutputFileName(id::Int, filename)
    ccall((:SetSelectedOutputFileName, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cstring), id, filename)
end

function SetSelectedOutputFileOn(id::Int, sel_on::Int)
    ccall((:SetSelectedOutputFileOn, Lib_IPhreeqc_path), IPQ_RESULT, (Cint, Cint), id, sel_on)
end

function SetSelectedOutputStringOn(id::Int, sel_string_on::Int)
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
    ccall((:VarFreeString, Lib_IPhreeqc_path), Nothing, (Cstring,), pSrc)
end

function VarInit(pvar)
    ccall((:VarInit, Lib_IPhreeqc_path), Nothing, (Ptr{VAR},), pvar)
end

end # module
