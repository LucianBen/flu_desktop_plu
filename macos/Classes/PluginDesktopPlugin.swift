import Cocoa
import FlutterMacOS

public class PluginDesktopPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.medeli.dev/plugin_desktop", binaryMessenger: registrar.messenger)
    let instance = PluginDesktopPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "selectImage":
      selectPic(result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }


  private func selectPic(_ flutterResult: FlutterResult){
          let dialog = NSOpenPanel();

          dialog.title                   = "请选择一张图片";
          dialog.showsResizeIndicator    = true;
          dialog.showsHiddenFiles        = false;
          dialog.allowsMultipleSelection = false;// 禁止多个文件选择
          dialog.canChooseDirectories = false;
          dialog.allowedFileTypes        = ["png", "jpg", "jpeg", "gif"];

          if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
              let result = dialog.url // Pathname of the file
            
              if (result != nil) {
                  let path: String = result!.path
                  flutterResult(path)
              }

          } else {
              // User clicked on "Cancel"
              flutterResult("")
              return
          }
      }

}
