/* 
 * Use macism to check the ime status and show it in sketchybar.
 * Updates every 200 ms.
 *
 * Compile with this:
 * clang -std=c99 ime.c -framework CoreFoundation -o ime-0615
 */
#include "sketchybar.h"
#include <CoreFoundation/CoreFoundation.h>
#include <stdio.h>
#include <string.h>

void callback(CFRunLoopTimerRef timer, void *info) {
  FILE * fp = popen("macism", "r");
  char buffer[80];
  fgets(buffer, sizeof(buffer), fp);
  pclose(fp);

  if (strcmp(buffer, "com.apple.keylayout.ABC\n") == 0) {
    sketchybar("--set ime label=A");
  }

  if (strcmp(buffer, "com.apple.inputmethod.SCIM.ITABC\n") == 0) {
    sketchybar("--set ime label=拼");
  }
}

int count_process() {
  FILE * fp = popen("ps -A -o comm= | grep -c '.*ime-0615$'", "r");

  int count;
  fscanf(fp, "%d", &count);

  return count;
}

int main() {
  /* Must be greater than 1 because if there is any existing process, this
   * process makes them two in total.
   */
  if (count_process() >= 2) {
    printf("An ime helper process is already running!");
    return 0;
  }

  CFRunLoopTimerRef timer = CFRunLoopTimerCreate(
      kCFAllocatorDefault, (int64_t)CFAbsoluteTimeGetCurrent() + 1.0, 0.2, 0, 0,
      callback, NULL);
  CFRunLoopAddTimer(CFRunLoopGetMain(), timer, kCFRunLoopDefaultMode);
  CFRunLoopRun();
  return 0;
}
