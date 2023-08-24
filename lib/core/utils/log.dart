

Object? valueLogDebugTest;
var valueLogErrorTest;
var valueLogStackTest;

void logDebug({String tag = '======', required Object value}) {
  valueLogDebugTest = value;

//  logger.v("Verbose log");

  // logger.i("${value.toString()}");

// logger.i("Info log");

// logger.w("Warning log");

// logger.e("Error log");
// /
// logger.wtf("What a terrible failure log");

  print('$tag: ${value.toString()}');
}



void logError({error, stack}) {
  if (error != null) {
    valueLogErrorTest = error;
    print('error: $error');
  }
  if (stack != null) {
    valueLogStackTest = stack;
    print('stack: $stack');
  }
}
