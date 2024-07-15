//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <windows_notification/windows_notification_plugin_c_api.h>
#include <windows_taskbar/windows_taskbar_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  WindowsNotificationPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowsNotificationPluginCApi"));
  WindowsTaskbarPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowsTaskbarPlugin"));
}
