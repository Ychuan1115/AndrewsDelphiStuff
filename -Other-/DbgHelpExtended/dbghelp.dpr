library dbghelp;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Unit1 in 'Unit1.pas',
  JclDebug in 'JclDebug.pas';
  //mcOfflineDebugInfo in 'mcOfflineDebugInfo.pas',
  //JwaPsApi in '..\Jedi\Win32API\JwaPsApi.pas';

{$R *.res}

exports
  DbgHelpCreateUserDump,
  DbgHelpCreateUserDumpW,
  EnumDirTree,
  EnumDirTreeW,
  EnumerateLoadedModules,
  EnumerateLoadedModules64,
  EnumerateLoadedModulesEx,
  EnumerateLoadedModulesExW,
  EnumerateLoadedModulesW64,
  ExtensionApiVersion,
  FindDebugInfoFile,
  FindDebugInfoFileEx,
  FindDebugInfoFileExW,
  FindExecutableImage,
  FindExecutableImageEx,
  FindExecutableImageExW,
  FindFileInPath,
  FindFileInSearchPath,
  GetTimestampForLoadedLibrary,
  ImageDirectoryEntryToData,
  ImageDirectoryEntryToDataEx,
  ImageNtHeader,
  ImageRvaToSection,
  ImageRvaToVa,
  ImagehlpApiVersion,
  ImagehlpApiVersionEx,
  MakeSureDirectoryPathExists,
  MapDebugInformation,
  MiniDumpReadDumpStream,
  MiniDumpWriteDump,
  SearchTreeForFile,
  SearchTreeForFileW,
  StackWalk,
  StackWalk64,
  SymAddSourceStream,
  SymAddSourceStreamA,
  SymAddSourceStreamW,
  SymAddSymbol,
  SymAddSymbolW,
  SymCleanup,
  SymDeleteSymbol,
  SymDeleteSymbolW,
  SymEnumLines,
  SymEnumLinesW,
  SymEnumProcesses,
  SymEnumSourceFileTokens,
  SymEnumSourceFiles,
  SymEnumSourceFilesW,
  SymEnumSourceLines,
  SymEnumSourceLinesW,
  SymEnumSym,
  SymEnumSymbols,
  SymEnumSymbolsForAddr,
  SymEnumSymbolsForAddrW,
  SymEnumSymbolsW,
  SymEnumTypes,
  SymEnumTypesByName,
  SymEnumTypesByNameW,
  SymEnumTypesW,
  SymEnumerateModules,
  SymEnumerateModules64,
  SymEnumerateModulesW64,
  SymEnumerateSymbols,
  SymEnumerateSymbols64,
  SymEnumerateSymbolsW,
  SymEnumerateSymbolsW64,
  SymFindDebugInfoFile,
  SymFindDebugInfoFileW,
  SymFindExecutableImage,
  SymFindExecutableImageW,
  SymFindFileInPath,
  SymFindFileInPathW,
  SymFromAddr,
  SymFromAddrW,
  SymFromIndex,
  SymFromIndexW,
  SymFromName,
  SymFromNameW,
  SymFromToken,
  SymFromTokenW,
  SymFunctionTableAccess,
  SymFunctionTableAccess64,
  SymGetFileLineOffsets64,
  SymGetHomeDirectory,
  SymGetHomeDirectoryW,
  SymGetLineFromAddr,
  SymGetLineFromAddr64,
  SymGetLineFromAddrW64,
  SymGetLineFromName,
  SymGetLineFromName64,
  SymGetLineFromNameW64,
  SymGetLineNext,
  SymGetLineNext64,
  SymGetLineNextW64,
  SymGetLinePrev,
  SymGetLinePrev64,
  SymGetLinePrevW64,
  SymGetModuleBase,
  SymGetModuleBase64,
  SymGetModuleInfo,
  SymGetModuleInfo64,
  SymGetModuleInfoW,
  SymGetModuleInfoW64,
  SymGetOmapBlockBase,
  SymGetOmaps,
  SymGetOptions,
  SymGetScope,
  SymGetScopeW,
  SymGetSearchPath,
  SymGetSearchPathW,
  SymGetSourceFile,
  SymGetSourceFileFromToken,
  SymGetSourceFileFromTokenW,
  SymGetSourceFileToken,
  SymGetSourceFileTokenW,
  SymGetSourceFileW,
  SymGetSourceVarFromToken,
  SymGetSourceVarFromTokenW,
  SymGetSymFromAddr,
  SymGetSymFromAddr64,
  SymGetSymFromName,
  SymGetSymFromName64,
  SymGetSymNext,
  SymGetSymNext64,
  SymGetSymPrev,
  SymGetSymPrev64,
  SymGetSymbolFile,
  SymGetSymbolFileW,
  SymGetTypeFromName,
  SymGetTypeFromNameW,
  SymGetTypeInfo,
  SymGetTypeInfoEx,
  SymGetUnwindInfo,
  SymInitialize,
  SymInitializeW,
  SymLoadModule,
  SymLoadModule64,
  SymLoadModuleEx,
  SymLoadModuleExW,
  SymMatchFileName,
  SymMatchFileNameW,
  SymMatchString,
  SymMatchStringA,
  SymMatchStringW,
  SymNext,
  SymNextW,
  SymPrev,
  SymPrevW,
  SymRefreshModuleList,
  SymRegisterCallback,
  SymRegisterCallback64,
  SymRegisterCallbackW64,
  SymRegisterFunctionEntryCallback,
  SymRegisterFunctionEntryCallback64,
  SymSearch,
  SymSearchW,
  SymSetContext,
  SymSetHomeDirectory,
  SymSetHomeDirectoryW,
  SymSetOptions,
  SymSetParentWindow,
  SymSetScopeFromAddr,
  SymSetScopeFromIndex,
  SymSetSearchPath,
  SymSetSearchPathW,
  SymSrvDeltaName,
  SymSrvDeltaNameW,
  SymSrvGetFileIndexInfo,
  SymSrvGetFileIndexInfoW,
  SymSrvGetFileIndexString,
  SymSrvGetFileIndexStringW,
  SymSrvGetFileIndexes,
  SymSrvGetFileIndexesW,
  SymSrvGetSupplement,
  SymSrvGetSupplementW,
  SymSrvIsStore,
  SymSrvIsStoreW,
  SymSrvStoreFile,
  SymSrvStoreFileW,
  SymSrvStoreSupplement,
  SymSrvStoreSupplementW,
  SymUnDName,
  SymUnDName64,
  SymUnloadModule,
  SymUnloadModule64,
  UnDecorateSymbolName,
  UnDecorateSymbolNameW,
  UnmapDebugInformation,
  WinDbgExtensionDllInit,
  block,
  chksym,
  dbghelp_ name 'dbghelp',
  dh,
  fptr,
  homedir,
  itoldyouso,
  lmi,
  lminfo,
  omap,
  srcfiles,
  stack_force_ebp,
  stackdbg,
  sym,
  symsrv,
  vc7fpo;

begin
end.