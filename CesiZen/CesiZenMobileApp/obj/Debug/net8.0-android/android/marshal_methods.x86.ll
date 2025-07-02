; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [406 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [806 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 233
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 321
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 355
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 267
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 65960268, ; 10: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 266
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 396
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 263
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83768722, ; 16: Microsoft.AspNetCore.Cryptography.Internal => 0x4fe3592 => 182
	i32 98325684, ; 17: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 234
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 339
	i32 117431740, ; 19: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 20: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 339
	i32 122350210, ; 21: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 359
	i32 142721839, ; 23: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 24: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 25: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 26: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 295
	i32 176265551, ; 27: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 28: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 216
	i32 179062648, ; 29: Microsoft.AspNetCore.Mvc.Razor => 0xaac4778 => 205
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 341
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 32: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 393
	i32 199333315, ; 33: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 394
	i32 205061960, ; 34: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 35: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 293
	i32 220171995, ; 36: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 37: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 315
	i32 230752869, ; 38: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 39: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 40: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 41: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 252019042, ; 42: Microsoft.AspNetCore.Razor.Runtime => 0xf058162 => 212
	i32 261689757, ; 43: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 298
	i32 276479776, ; 44: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 45: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 317
	i32 280482487, ; 46: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 314
	i32 280992041, ; 47: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 365
	i32 291076382, ; 48: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 49: System.Net.Ping.dll => 0x11d123fd => 69
	i32 300686228, ; 50: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0x11ec1b94 => 177
	i32 304965818, ; 51: CesiZenMobileApp.dll => 0x122d68ba => 0
	i32 310070955, ; 52: Microsoft.AspNetCore.Mvc => 0x127b4eab => 197
	i32 317674968, ; 53: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 393
	i32 318968648, ; 54: Xamarin.AndroidX.Activity.dll => 0x13031348 => 284
	i32 321597661, ; 55: System.Numerics => 0x132b30dd => 83
	i32 330147069, ; 56: Microsoft.SqlServer.Server => 0x13ada4fd => 265
	i32 336156722, ; 57: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 378
	i32 336788001, ; 58: Microsoft.AspNetCore.Antiforgery => 0x1412fa21 => 176
	i32 338324308, ; 59: Microsoft.AspNetCore.Mvc.DataAnnotations.dll => 0x142a6b54 => 202
	i32 342366114, ; 60: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 316
	i32 344827588, ; 61: Microsoft.AspNetCore.ResponseCaching.Abstractions => 0x148da6c4 => 213
	i32 356389973, ; 62: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 377
	i32 360082299, ; 63: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 64: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 65: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 66: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 67: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 384051609, ; 68: Microsoft.AspNetCore.Routing.dll => 0x16e42999 => 214
	i32 385762202, ; 69: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 70: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 71: _Microsoft.Android.Resource.Designer => 0x17969339 => 402
	i32 403441872, ; 72: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 73: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 389
	i32 441335492, ; 74: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 299
	i32 442565967, ; 75: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 76: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 312
	i32 451504562, ; 77: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 78: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 79: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 80: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 81: System.dll => 0x1bff388e => 164
	i32 476646585, ; 82: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 314
	i32 485463106, ; 83: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 252
	i32 486930444, ; 84: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 327
	i32 490002678, ; 85: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x1d34d8f6 => 188
	i32 498788369, ; 86: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 87: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 376
	i32 503918385, ; 88: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 370
	i32 513247710, ; 89: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 248
	i32 526420162, ; 90: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 91: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 359
	i32 530272170, ; 92: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 93: Microsoft.Extensions.Logging => 0x20216150 => 243
	i32 540030774, ; 94: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 95: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 96: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 97: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 217
	i32 549171840, ; 98: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 99: Jsr305Binding => 0x213954e7 => 352
	i32 559063233, ; 100: Microsoft.AspNetCore.Razor.Language.dll => 0x2152a0c1 => 211
	i32 569601784, ; 101: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 350
	i32 577335427, ; 102: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 103: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 384
	i32 601371474, ; 104: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 105: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 106: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 107: Xamarin.AndroidX.CustomView => 0x2568904f => 304
	i32 627931235, ; 108: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 382
	i32 639843206, ; 109: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 310
	i32 643868501, ; 110: System.Net => 0x2660a755 => 81
	i32 662205335, ; 111: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 112: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 346
	i32 666292255, ; 113: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 291
	i32 672442732, ; 114: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 115: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 116: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 364
	i32 690569205, ; 117: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 118: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 361
	i32 693804605, ; 119: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 120: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 121: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 356
	i32 700358131, ; 122: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 123: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 379
	i32 709152836, ; 124: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 275
	i32 709557578, ; 125: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 367
	i32 720511267, ; 126: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 360
	i32 722857257, ; 127: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 723796036, ; 128: System.ClientModel.dll => 0x2b244044 => 269
	i32 724146010, ; 129: Microsoft.AspNetCore.Authorization.Policy.dll => 0x2b29975a => 180
	i32 730737221, ; 130: Microsoft.AspNetCore.Mvc.Razor.dll => 0x2b8e2a45 => 205
	i32 734129105, ; 131: Microsoft.AspNetCore.Razor => 0x2bc1ebd1 => 210
	i32 735137430, ; 132: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 133: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 134: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 281
	i32 759454413, ; 135: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 136: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 137: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 138: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 388
	i32 789151979, ; 139: Microsoft.Extensions.Options => 0x2f0980eb => 247
	i32 790371945, ; 140: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 305
	i32 804715423, ; 141: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 142: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 319
	i32 809499826, ; 143: Microsoft.AspNetCore.Mvc.ViewFeatures => 0x303ffcb2 => 209
	i32 809851609, ; 144: System.Drawing.Common.dll => 0x30455ad9 => 271
	i32 818807279, ; 145: Microsoft.AspNetCore.Mvc.Cors.dll => 0x30ce01ef => 201
	i32 823281589, ; 146: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 147: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 148: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 149: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 150: Xamarin.AndroidX.Print => 0x3246f6cd => 332
	i32 872446091, ; 151: Microsoft.AspNetCore.Razor.dll => 0x3400788b => 210
	i32 873119928, ; 152: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 153: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 154: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 155: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 156: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 157: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 391
	i32 928116545, ; 158: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 355
	i32 940221205, ; 159: Microsoft.CodeAnalysis.Razor => 0x380aa315 => 220
	i32 952186615, ; 160: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 161: Newtonsoft.Json => 0x38f24a24 => 267
	i32 956575887, ; 162: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 360
	i32 966729478, ; 163: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 353
	i32 967690846, ; 164: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 316
	i32 972467304, ; 165: Microsoft.AspNetCore.Razor.Language => 0x39f6ac68 => 211
	i32 975236339, ; 166: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 167: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 168: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 169: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 170: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 171: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 172: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 237
	i32 1001831731, ; 173: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1009232667, ; 174: Microsoft.AspNetCore.Html.Abstractions.dll => 0x3c27ab1b => 189
	i32 1012816738, ; 175: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 336
	i32 1019214401, ; 176: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 177: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 232
	i32 1029334545, ; 178: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 366
	i32 1031528504, ; 179: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 354
	i32 1035644815, ; 180: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 289
	i32 1036536393, ; 181: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 182: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 183: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 234
	i32 1052210849, ; 184: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 323
	i32 1054642859, ; 185: Microsoft.AspNetCore.Html.Abstractions => 0x3edc92ab => 189
	i32 1062017875, ; 186: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 251
	i32 1067306892, ; 187: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 188: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 189: Xamarin.Kotlin.StdLib => 0x409e66d8 => 357
	i32 1098259244, ; 190: System => 0x41761b2c => 164
	i32 1099692271, ; 191: Microsoft.DotNet.PlatformAbstractions => 0x418bf8ef => 222
	i32 1110309514, ; 192: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 238
	i32 1112354281, ; 193: Microsoft.AspNetCore.Authentication.Abstractions => 0x424d2de9 => 177
	i32 1118262833, ; 194: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 379
	i32 1121599056, ; 195: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 322
	i32 1127624469, ; 196: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 245
	i32 1135815421, ; 197: Microsoft.AspNetCore.Cryptography.KeyDerivation.dll => 0x43b32afd => 183
	i32 1138436374, ; 198: Microsoft.Data.SqlClient.dll => 0x43db2916 => 221
	i32 1145483052, ; 199: System.Windows.Extensions.dll => 0x4446af2c => 279
	i32 1149092582, ; 200: Xamarin.AndroidX.Window => 0x447dc2e6 => 349
	i32 1157931901, ; 201: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 224
	i32 1162633754, ; 202: CesiZenModel.dll => 0x454c621a => 398
	i32 1168523401, ; 203: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 385
	i32 1170634674, ; 204: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 205: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 235
	i32 1175144683, ; 206: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 345
	i32 1178241025, ; 207: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 330
	i32 1186231468, ; 208: Newtonsoft.Json.Bson.dll => 0x46b474ac => 268
	i32 1202000627, ; 209: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 224
	i32 1203215381, ; 210: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 383
	i32 1204270330, ; 211: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 291
	i32 1204575371, ; 212: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 228
	i32 1208641965, ; 213: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 214: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1220193633, ; 215: Microsoft.Net.Http.Headers => 0x48baad61 => 264
	i32 1224544870, ; 216: Microsoft.AspNetCore.Mvc.RazorPages.dll => 0x48fd1266 => 207
	i32 1234928153, ; 217: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 381
	i32 1236289705, ; 218: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x49b048a9 => 188
	i32 1243150071, ; 219: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 350
	i32 1253011324, ; 220: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 221: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 365
	i32 1264128115, ; 222: CesiZenInfrastructure => 0x4b591073 => 397
	i32 1264511973, ; 223: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 340
	i32 1266143716, ; 224: Microsoft.AspNetCore.Mvc.TagHelpers.dll => 0x4b77d1e4 => 208
	i32 1267360935, ; 225: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 344
	i32 1267908789, ; 226: Microsoft.AspNetCore.Routing => 0x4b92c0b5 => 214
	i32 1273260888, ; 227: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 296
	i32 1275534314, ; 228: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 361
	i32 1278448581, ; 229: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 288
	i32 1293217323, ; 230: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 307
	i32 1309188875, ; 231: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 232: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 349
	i32 1324164729, ; 233: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 234: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 235: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 236: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 395
	i32 1376866003, ; 237: Xamarin.AndroidX.SavedState => 0x52114ed3 => 336
	i32 1379779777, ; 238: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 239: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 240: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 300
	i32 1408764838, ; 241: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 242: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 243: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 244: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 363
	i32 1434145427, ; 245: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 246: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 353
	i32 1439761251, ; 247: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 248: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 249: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 250: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 236
	i32 1457743152, ; 251: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 252: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 253: System.IdentityModel.Tokens.Jwt => 0x57137723 => 272
	i32 1461004990, ; 254: es\Microsoft.Maui.Controls.resources => 0x57152abe => 369
	i32 1461234159, ; 255: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 256: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 257: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 258: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 290
	i32 1470490898, ; 259: Microsoft.Extensions.Primitives => 0x57a5e912 => 248
	i32 1479771757, ; 260: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 261: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 262: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 263: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 337
	i32 1493001747, ; 264: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 373
	i32 1498168481, ; 265: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 253
	i32 1514721132, ; 266: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 368
	i32 1521091094, ; 267: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 237
	i32 1527852131, ; 268: Microsoft.AspNetCore.Mvc.Localization.dll => 0x5b112c63 => 204
	i32 1536373174, ; 269: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 270: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 271: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 272: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 273: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 388
	i32 1565310744, ; 274: System.Runtime.Caching => 0x5d4cbf18 => 274
	i32 1565862583, ; 275: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 276: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1566350289, ; 277: Microsoft.AspNetCore.Mvc.Cors => 0x5d5c9bd1 => 201
	i32 1573704789, ; 278: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 279: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582305585, ; 280: Azure.Identity => 0x5e501131 => 174
	i32 1582372066, ; 281: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 306
	i32 1592978981, ; 282: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 283: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 354
	i32 1601112923, ; 284: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 285: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 399
	i32 1604827217, ; 286: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 287: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 288: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 326
	i32 1622358360, ; 289: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 290: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 348
	i32 1625077857, ; 291: Microsoft.AspNetCore.Antiforgery.dll => 0x60dcb861 => 176
	i32 1628113371, ; 292: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 256
	i32 1635184631, ; 293: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 310
	i32 1636350590, ; 294: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 303
	i32 1639515021, ; 295: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 296: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 297: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 298: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 299: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 342
	i32 1658251792, ; 300: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 351
	i32 1670060433, ; 301: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 298
	i32 1675553242, ; 302: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 303: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 304: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 305: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1689493916, ; 306: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 223
	i32 1691477237, ; 307: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 308: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 309: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 358
	i32 1701541528, ; 310: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 311: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 319
	i32 1726116996, ; 312: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 313: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 314: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 294
	i32 1736233607, ; 315: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 386
	i32 1743415430, ; 316: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 364
	i32 1744735666, ; 317: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 318: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 319: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 320: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 321: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 322: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 323: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 341
	i32 1770582343, ; 324: Microsoft.Extensions.Logging.dll => 0x6988f147 => 243
	i32 1776026572, ; 325: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 326: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 327: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 328: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 380
	i32 1788241197, ; 329: Xamarin.AndroidX.Fragment => 0x6a96652d => 312
	i32 1793755602, ; 330: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 372
	i32 1794500907, ; 331: Microsoft.Identity.Client.dll => 0x6af5e92b => 250
	i32 1796167890, ; 332: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 217
	i32 1808609942, ; 333: Xamarin.AndroidX.Loader => 0x6bcd3296 => 326
	i32 1813058853, ; 334: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 357
	i32 1813201214, ; 335: Xamarin.Google.Android.Material => 0x6c13413e => 351
	i32 1818569960, ; 336: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 331
	i32 1818787751, ; 337: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819327070, ; 338: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 193
	i32 1820883333, ; 339: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x6c887985 => 182
	i32 1824175904, ; 340: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 341: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827303595, ; 342: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 401
	i32 1828688058, ; 343: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 244
	i32 1829150748, ; 344: System.Windows.Extensions => 0x6d06a01c => 279
	i32 1842015223, ; 345: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 392
	i32 1847515442, ; 346: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 281
	i32 1853025655, ; 347: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 389
	i32 1858542181, ; 348: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 349: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1871986876, ; 350: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 256
	i32 1875935024, ; 351: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 371
	i32 1879696579, ; 352: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 353: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 292
	i32 1885918049, ; 354: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 401
	i32 1888955245, ; 355: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 356: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1894524299, ; 357: Microsoft.DotNet.PlatformAbstractions.dll => 0x70ec258b => 222
	i32 1898237753, ; 358: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 359: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 360: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1921968366, ; 361: Microsoft.AspNetCore.Mvc.Formatters.Json => 0x728ee8ee => 203
	i32 1928288591, ; 362: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 191
	i32 1939592360, ; 363: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953680223, ; 364: Microsoft.AspNetCore.DataProtection.Abstractions => 0x7472cb5f => 185
	i32 1956758971, ; 365: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 366: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 338
	i32 1967298789, ; 367: Microsoft.AspNetCore.Diagnostics.Abstractions.dll => 0x754298e5 => 186
	i32 1968388702, ; 368: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 229
	i32 1983156543, ; 369: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 358
	i32 1985761444, ; 370: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 283
	i32 1986222447, ; 371: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 257
	i32 1991044029, ; 372: Microsoft.Extensions.Identity.Core.dll => 0x76acebbd => 239
	i32 1991196148, ; 373: Microsoft.AspNetCore.Identity.EntityFrameworkCore.dll => 0x76af3df4 => 194
	i32 2003115576, ; 374: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 368
	i32 2011961780, ; 375: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 376: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 323
	i32 2025202353, ; 377: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 363
	i32 2031763787, ; 378: Xamarin.Android.Glide => 0x791a414b => 280
	i32 2032055961, ; 379: CesiZenMobileApp => 0x791eb699 => 0
	i32 2040764568, ; 380: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 251
	i32 2045470958, ; 381: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 382: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 318
	i32 2060060697, ; 383: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 384: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 367
	i32 2069514766, ; 385: Newtonsoft.Json.Bson => 0x7b5a4a0e => 268
	i32 2070888862, ; 386: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2075706075, ; 387: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 191
	i32 2076659885, ; 388: Microsoft.Extensions.WebEncoders => 0x7bc750ad => 249
	i32 2079903147, ; 389: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2085039813, ; 390: System.Security.Cryptography.Xml.dll => 0x7c472ec5 => 277
	i32 2090596640, ; 391: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2092734687, ; 392: Microsoft.AspNetCore.JsonPatch => 0x7cbc98df => 195
	i32 2113455254, ; 393: Microsoft.AspNetCore.Mvc.ApiExplorer.dll => 0x7df8c496 => 199
	i32 2120057885, ; 394: Microsoft.AspNetCore.Mvc.Formatters.Json.dll => 0x7e5d841d => 203
	i32 2127167465, ; 395: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 396: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 397: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 398: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 399: Microsoft.Maui => 0x80bd55ad => 261
	i32 2169148018, ; 400: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 375
	i32 2181898931, ; 401: Microsoft.Extensions.Options.dll => 0x820d22b3 => 247
	i32 2182738860, ; 402: Microsoft.AspNetCore.Mvc.Core.dll => 0x8219f3ac => 200
	i32 2192057212, ; 403: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 244
	i32 2193016926, ; 404: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197979891, ; 405: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 233
	i32 2201107256, ; 406: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 362
	i32 2201231467, ; 407: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 408: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 246
	i32 2207618523, ; 409: it\Microsoft.Maui.Controls.resources => 0x839595db => 377
	i32 2217644978, ; 410: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 345
	i32 2222056684, ; 411: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2242871324, ; 412: Microsoft.AspNetCore.Http.dll => 0x85af801c => 190
	i32 2244775296, ; 413: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 327
	i32 2252106437, ; 414: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 415: Microsoft.EntityFrameworkCore => 0x86487ec9 => 223
	i32 2253551641, ; 416: Microsoft.IdentityModel.Protocols => 0x86527819 => 255
	i32 2256313426, ; 417: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 418: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 419: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 230
	i32 2267999099, ; 420: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 282
	i32 2270573516, ; 421: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 371
	i32 2274912384, ; 422: Microsoft.Extensions.Identity.Stores => 0x87986880 => 240
	i32 2279755925, ; 423: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 334
	i32 2285293097, ; 424: Microsoft.AspNetCore.Mvc.Abstractions => 0x8836ce29 => 198
	i32 2291847450, ; 425: Microsoft.AspNetCore.DataProtection.dll => 0x889ad11a => 184
	i32 2293034957, ; 426: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 427: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 428: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 429: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 381
	i32 2305521784, ; 430: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 431: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 286
	i32 2320631194, ; 432: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2321784778, ; 433: Microsoft.AspNetCore.Mvc.Abstractions.dll => 0x8a639fca => 198
	i32 2336114998, ; 434: Microsoft.AspNetCore.Mvc.Localization => 0x8b3e4936 => 204
	i32 2340441535, ; 435: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 436: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 437: System.Net.Primitives => 0x8c40e0db => 70
	i32 2360546104, ; 438: Microsoft.AspNetCore.Localization.dll => 0x8cb31338 => 196
	i32 2368005991, ; 439: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 440: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 254
	i32 2371007202, ; 441: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 229
	i32 2378619854, ; 442: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 443: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 444: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 376
	i32 2401565422, ; 445: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 446: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 309
	i32 2406371028, ; 447: Microsoft.Extensions.Identity.Stores.dll => 0x8f6e4ed4 => 240
	i32 2409983638, ; 448: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 400
	i32 2421380589, ; 449: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 450: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 296
	i32 2427245696, ; 451: Microsoft.CodeAnalysis.Razor.dll => 0x90acd480 => 220
	i32 2427813419, ; 452: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 373
	i32 2435356389, ; 453: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 454: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2451271121, ; 455: Microsoft.AspNetCore.Mvc.RazorPages => 0x921b6dd1 => 207
	i32 2454642406, ; 456: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458592288, ; 457: Microsoft.AspNetCore.Authentication.Core => 0x928b2420 => 178
	i32 2458678730, ; 458: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 459: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 460: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 299
	i32 2471841756, ; 461: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 462: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 463: Microsoft.Maui.Controls => 0x93dba8a1 => 259
	i32 2483903535, ; 464: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 465: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 466: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 467: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 468: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 321
	i32 2522472828, ; 469: Xamarin.Android.Glide.dll => 0x9659e17c => 280
	i32 2528662365, ; 470: Microsoft.AspNetCore.JsonPatch.dll => 0x96b8535d => 195
	i32 2537015816, ; 471: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 179
	i32 2538310050, ; 472: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 473: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 374
	i32 2562349572, ; 474: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 475: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 476: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 322
	i32 2581819634, ; 477: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 344
	i32 2585220780, ; 478: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 479: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 480: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 481: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 235
	i32 2593268061, ; 482: Microsoft.AspNetCore.Routing.Abstractions.dll => 0x9a92215d => 215
	i32 2593496499, ; 483: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 383
	i32 2594125473, ; 484: Microsoft.AspNetCore.Hosting.Abstractions => 0x9a9f36a1 => 187
	i32 2605712449, ; 485: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 362
	i32 2611529777, ; 486: Microsoft.AspNetCore.Mvc.dll => 0x9ba8c831 => 197
	i32 2615233544, ; 487: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 313
	i32 2616218305, ; 488: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 245
	i32 2617129537, ; 489: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 490: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 491: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 303
	i32 2624644809, ; 492: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 308
	i32 2626831493, ; 493: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 378
	i32 2627185994, ; 494: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2628210652, ; 495: System.Memory.Data => 0x9ca74fdc => 273
	i32 2629843544, ; 496: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 497: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 317
	i32 2633959305, ; 498: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 192
	i32 2634653062, ; 499: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 225
	i32 2640290731, ; 500: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 254
	i32 2640706905, ; 501: Azure.Core => 0x9d65fd59 => 173
	i32 2660759594, ; 502: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 276
	i32 2663391936, ; 503: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 282
	i32 2663698177, ; 504: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 505: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 506: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 507: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 508: Azure.Identity.dll => 0x9f9148fa => 174
	i32 2686887180, ; 509: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 510: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 511: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 342
	i32 2715334215, ; 512: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 513: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 514: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2722434549, ; 515: Microsoft.CodeAnalysis.dll => 0xa2450df5 => 218
	i32 2724373263, ; 516: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 517: Xamarin.AndroidX.Activity => 0xa2e0939b => 284
	i32 2735172069, ; 518: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 519: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 179
	i32 2737747696, ; 520: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 290
	i32 2740051746, ; 521: Microsoft.Identity.Client => 0xa351df22 => 250
	i32 2740948882, ; 522: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 523: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 524: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 384
	i32 2755098380, ; 525: Microsoft.SqlServer.Server.dll => 0xa437770c => 265
	i32 2755643133, ; 526: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 226
	i32 2758225723, ; 527: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 260
	i32 2764765095, ; 528: Microsoft.Maui.dll => 0xa4caf7a7 => 261
	i32 2765824710, ; 529: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 530: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 356
	i32 2778768386, ; 531: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 347
	i32 2779977773, ; 532: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 335
	i32 2785988530, ; 533: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 390
	i32 2788224221, ; 534: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 313
	i32 2795666278, ; 535: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 266
	i32 2801831435, ; 536: Microsoft.Maui.Graphics => 0xa7008e0b => 263
	i32 2803228030, ; 537: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 538: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 369
	i32 2810250172, ; 539: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 300
	i32 2819470561, ; 540: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 541: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 542: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 335
	i32 2824502124, ; 543: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 544: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 382
	i32 2838993487, ; 545: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 324
	i32 2841355853, ; 546: System.Security.Permissions => 0xa95ba64d => 278
	i32 2847789619, ; 547: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 225
	i32 2849599387, ; 548: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2850549256, ; 549: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 193
	i32 2853208004, ; 550: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 347
	i32 2855708567, ; 551: Xamarin.AndroidX.Transition => 0xaa36a797 => 343
	i32 2861098320, ; 552: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 553: Microsoft.Maui.Essentials => 0xaa8a4878 => 262
	i32 2867946736, ; 554: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 276
	i32 2870099610, ; 555: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 285
	i32 2875164099, ; 556: Jsr305Binding.dll => 0xab5f85c3 => 352
	i32 2875220617, ; 557: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 558: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 311
	i32 2887636118, ; 559: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 560: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 561: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 562: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 563: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 564: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 565: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 348
	i32 2919462931, ; 566: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 567: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 287
	i32 2921417940, ; 568: System.Security.Cryptography.Xml => 0xae214cd4 => 277
	i32 2930358886, ; 569: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 0xaea9ba66 => 185
	i32 2936416060, ; 570: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 571: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 572: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 573: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 270
	i32 2959614098, ; 574: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 575: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 576: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978368250, ; 577: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0xb1864afa => 187
	i32 2978675010, ; 578: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 307
	i32 2987532451, ; 579: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 338
	i32 2991968803, ; 580: CesiZenInfrastructure.dll => 0xb255d223 => 397
	i32 2996646946, ; 581: Microsoft.AspNetCore.Http => 0xb29d3422 => 190
	i32 2996846495, ; 582: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 320
	i32 3012788804, ; 583: System.Configuration.ConfigurationManager => 0xb3938244 => 270
	i32 3014607031, ; 584: Microsoft.AspNetCore.Cryptography.KeyDerivation => 0xb3af40b7 => 183
	i32 3016983068, ; 585: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 340
	i32 3023353419, ; 586: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 587: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 315
	i32 3031482113, ; 588: CesiZenModel => 0xb4b0bf01 => 398
	i32 3033331042, ; 589: Microsoft.AspNetCore.Authentication.Core.dll => 0xb4ccf562 => 178
	i32 3033605958, ; 590: System.Memory.Data.dll => 0xb4d12746 => 273
	i32 3036999524, ; 591: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 192
	i32 3038032645, ; 592: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 402
	i32 3050706616, ; 593: Microsoft.AspNetCore.Mvc.Razor.Extensions => 0xb5d616b8 => 206
	i32 3056245963, ; 594: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 337
	i32 3057625584, ; 595: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 328
	i32 3059408633, ; 596: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 597: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 598: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 227
	i32 3075834255, ; 599: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 600: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 375
	i32 3084678329, ; 601: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 257
	i32 3090735792, ; 602: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3093090641, ; 603: Microsoft.Extensions.WebEncoders.dll => 0xb85cd151 => 249
	i32 3099732863, ; 604: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 605: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 606: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3113762169, ; 607: Microsoft.AspNetCore.Routing.Abstractions => 0xb9983d79 => 215
	i32 3121463068, ; 608: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 609: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 610: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 611: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 612: GoogleGson.dll => 0xbba64c02 => 175
	i32 3151576809, ; 613: Microsoft.AspNetCore.Mvc.Core => 0xbbd93ee9 => 200
	i32 3155681111, ; 614: Microsoft.AspNetCore.DataProtection => 0xbc17df57 => 184
	i32 3159123045, ; 615: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 616: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3162781277, ; 617: Microsoft.AspNetCore.Cors.dll => 0xbc84365d => 181
	i32 3178803400, ; 618: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 329
	i32 3192346100, ; 619: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 620: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 621: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 227
	i32 3204380047, ; 622: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 623: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 624: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 306
	i32 3213246214, ; 625: System.Security.Permissions.dll => 0xbf863f06 => 278
	i32 3220365878, ; 626: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 627: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3228018376, ; 628: Microsoft.AspNetCore.ResponseCaching.Abstractions.dll => 0xc067a6c8 => 213
	i32 3251039220, ; 629: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 630: Xamarin.AndroidX.CardView => 0xc235e84d => 294
	i32 3265493905, ; 631: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 632: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 633: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 634: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 635: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 636: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 637: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 638: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 216
	i32 3303498502, ; 639: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 640: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 370
	i32 3312457198, ; 641: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 253
	i32 3316684772, ; 642: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 643: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 304
	i32 3317144872, ; 644: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 645: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 292
	i32 3345895724, ; 646: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 333
	i32 3346324047, ; 647: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 330
	i32 3357674450, ; 648: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 387
	i32 3358260929, ; 649: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 650: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 285
	i32 3362522851, ; 651: Xamarin.AndroidX.Core => 0xc86c06e3 => 301
	i32 3366347497, ; 652: Java.Interop => 0xc8a662e9 => 168
	i32 3374879918, ; 653: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 255
	i32 3374999561, ; 654: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 334
	i32 3381016424, ; 655: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 366
	i32 3395150330, ; 656: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 657: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 658: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 305
	i32 3406629867, ; 659: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 236
	i32 3428513518, ; 660: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 231
	i32 3429136800, ; 661: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 662: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 663: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 308
	i32 3445260447, ; 664: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 665: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 258
	i32 3463511458, ; 666: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 374
	i32 3471940407, ; 667: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 668: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 669: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 387
	i32 3484440000, ; 670: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 386
	i32 3485117614, ; 671: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 672: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 673: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 297
	i32 3509114376, ; 674: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 675: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 676: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 677: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545306353, ; 678: Microsoft.Data.SqlClient => 0xd35114f1 => 221
	i32 3558648585, ; 679: System.ClientModel => 0xd41cab09 => 269
	i32 3560100363, ; 680: System.Threading.Timer => 0xd432d20b => 147
	i32 3561949811, ; 681: Azure.Core.dll => 0xd44f0a73 => 173
	i32 3570554715, ; 682: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3570608287, ; 683: System.Runtime.Caching.dll => 0xd4d3289f => 274
	i32 3580758918, ; 684: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 394
	i32 3592435036, ; 685: Microsoft.Extensions.Localization.Abstractions => 0xd620355c => 242
	i32 3597029428, ; 686: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 283
	i32 3598340787, ; 687: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 688: System.Linq.dll => 0xd715a361 => 61
	i32 3619374377, ; 689: Microsoft.Extensions.Identity.Core => 0xd7bb4529 => 239
	i32 3624195450, ; 690: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 691: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 332
	i32 3633644679, ; 692: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 287
	i32 3638274909, ; 693: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 694: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 318
	i32 3643446276, ; 695: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 391
	i32 3643854240, ; 696: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 329
	i32 3645089577, ; 697: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 698: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 230
	i32 3660523487, ; 699: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 700: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676670898, ; 701: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 399
	i32 3682565725, ; 702: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 293
	i32 3684561358, ; 703: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 297
	i32 3687428684, ; 704: Microsoft.AspNetCore.Localization => 0xdbc9b24c => 196
	i32 3689375977, ; 705: System.Drawing.Common => 0xdbe768e9 => 271
	i32 3697841164, ; 706: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 396
	i32 3700591436, ; 707: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 252
	i32 3700866549, ; 708: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 709: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 302
	i32 3716563718, ; 710: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 711: Xamarin.AndroidX.Annotation => 0xdda814c6 => 286
	i32 3724971120, ; 712: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 328
	i32 3732100267, ; 713: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 714: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 715: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 716: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3765508441, ; 717: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 246
	i32 3776403777, ; 718: Microsoft.Extensions.Localization.Abstractions.dll => 0xe1175941 => 242
	i32 3786282454, ; 719: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 295
	i32 3792276235, ; 720: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 721: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 258
	i32 3802395368, ; 722: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3807198597, ; 723: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 275
	i32 3819260425, ; 724: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 725: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829324472, ; 726: Microsoft.AspNetCore.Mvc.Razor.Extensions.dll => 0xe43edab8 => 206
	i32 3829621856, ; 727: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 728: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 232
	i32 3844307129, ; 729: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 730: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 731: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 732: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 733: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 734: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 735: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 343
	i32 3888767677, ; 736: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 333
	i32 3889960447, ; 737: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 395
	i32 3893143201, ; 738: Microsoft.AspNetCore.Identity.EntityFrameworkCore => 0xe80ca6a1 => 194
	i32 3896106733, ; 739: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 740: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 301
	i32 3898971068, ; 741: Microsoft.Extensions.Localization.dll => 0xe86593bc => 241
	i32 3901907137, ; 742: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 743: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 744: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 346
	i32 3928044579, ; 745: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 746: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 747: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 331
	i32 3945713374, ; 748: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 749: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3954195687, ; 750: Microsoft.Extensions.Localization => 0xebb03ce7 => 241
	i32 3955647286, ; 751: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 289
	i32 3959773229, ; 752: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 320
	i32 3980434154, ; 753: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 390
	i32 3987592930, ; 754: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 372
	i32 4003436829, ; 755: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 756: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 288
	i32 4025784931, ; 757: System.Memory => 0xeff49a63 => 62
	i32 4026527876, ; 758: Microsoft.CodeAnalysis.CSharp => 0xeffff084 => 219
	i32 4029710644, ; 759: Microsoft.AspNetCore.Razor.Runtime.dll => 0xf0308134 => 212
	i32 4044155772, ; 760: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 264
	i32 4046471985, ; 761: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 260
	i32 4054681211, ; 762: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 763: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 764: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4078967171, ; 765: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 238
	i32 4094352644, ; 766: Microsoft.Maui.Essentials.dll => 0xf40add04 => 262
	i32 4099507663, ; 767: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 768: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 769: Xamarin.AndroidX.Emoji2 => 0xf479582c => 309
	i32 4101842092, ; 770: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 228
	i32 4102112229, ; 771: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 385
	i32 4116094207, ; 772: Microsoft.AspNetCore.Mvc.ApiExplorer => 0xf5569cff => 199
	i32 4125707920, ; 773: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 380
	i32 4126470640, ; 774: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 231
	i32 4127667938, ; 775: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 776: System.AppContext => 0xf6318da0 => 6
	i32 4141580284, ; 777: Microsoft.AspNetCore.Authorization.Policy => 0xf6db7ffc => 180
	i32 4147896353, ; 778: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 779: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 392
	i32 4151237749, ; 780: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 781: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 782: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 783: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4169285646, ; 784: Microsoft.AspNetCore.Mvc.ViewFeatures.dll => 0xf882400e => 209
	i32 4180982454, ; 785: Microsoft.AspNetCore.Diagnostics.Abstractions => 0xf934bab6 => 186
	i32 4181436372, ; 786: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 787: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 325
	i32 4182880526, ; 788: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 400
	i32 4185676441, ; 789: System.Security => 0xf97c5a99 => 130
	i32 4194278001, ; 790: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 226
	i32 4196171640, ; 791: Microsoft.CodeAnalysis => 0xfa1c7f78 => 218
	i32 4196529839, ; 792: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 793: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4217598431, ; 794: Microsoft.AspNetCore.Cors => 0xfb6371df => 181
	i32 4245218886, ; 795: Microsoft.CodeAnalysis.CSharp.dll => 0xfd08e646 => 219
	i32 4256097574, ; 796: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 302
	i32 4258378803, ; 797: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 324
	i32 4258913604, ; 798: Microsoft.AspNetCore.Mvc.DataAnnotations => 0xfdd9dd44 => 202
	i32 4260525087, ; 799: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 800: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 272
	i32 4271975918, ; 801: Microsoft.Maui.Controls.dll => 0xfea12dee => 259
	i32 4274976490, ; 802: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4277663213, ; 803: Microsoft.AspNetCore.Mvc.TagHelpers => 0xfef7f5ed => 208
	i32 4292120959, ; 804: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 325
	i32 4294763496 ; 805: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 311
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [806 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 233, ; 3
	i32 321, ; 4
	i32 355, ; 5
	i32 48, ; 6
	i32 267, ; 7
	i32 80, ; 8
	i32 145, ; 9
	i32 266, ; 10
	i32 30, ; 11
	i32 396, ; 12
	i32 124, ; 13
	i32 263, ; 14
	i32 102, ; 15
	i32 182, ; 16
	i32 234, ; 17
	i32 339, ; 18
	i32 107, ; 19
	i32 339, ; 20
	i32 139, ; 21
	i32 359, ; 22
	i32 77, ; 23
	i32 124, ; 24
	i32 13, ; 25
	i32 295, ; 26
	i32 132, ; 27
	i32 216, ; 28
	i32 205, ; 29
	i32 341, ; 30
	i32 151, ; 31
	i32 393, ; 32
	i32 394, ; 33
	i32 18, ; 34
	i32 293, ; 35
	i32 26, ; 36
	i32 315, ; 37
	i32 1, ; 38
	i32 59, ; 39
	i32 42, ; 40
	i32 91, ; 41
	i32 212, ; 42
	i32 298, ; 43
	i32 147, ; 44
	i32 317, ; 45
	i32 314, ; 46
	i32 365, ; 47
	i32 54, ; 48
	i32 69, ; 49
	i32 177, ; 50
	i32 0, ; 51
	i32 197, ; 52
	i32 393, ; 53
	i32 284, ; 54
	i32 83, ; 55
	i32 265, ; 56
	i32 378, ; 57
	i32 176, ; 58
	i32 202, ; 59
	i32 316, ; 60
	i32 213, ; 61
	i32 377, ; 62
	i32 131, ; 63
	i32 55, ; 64
	i32 149, ; 65
	i32 74, ; 66
	i32 145, ; 67
	i32 214, ; 68
	i32 62, ; 69
	i32 146, ; 70
	i32 402, ; 71
	i32 165, ; 72
	i32 389, ; 73
	i32 299, ; 74
	i32 12, ; 75
	i32 312, ; 76
	i32 125, ; 77
	i32 152, ; 78
	i32 113, ; 79
	i32 166, ; 80
	i32 164, ; 81
	i32 314, ; 82
	i32 252, ; 83
	i32 327, ; 84
	i32 188, ; 85
	i32 84, ; 86
	i32 376, ; 87
	i32 370, ; 88
	i32 248, ; 89
	i32 150, ; 90
	i32 359, ; 91
	i32 60, ; 92
	i32 243, ; 93
	i32 51, ; 94
	i32 103, ; 95
	i32 114, ; 96
	i32 217, ; 97
	i32 40, ; 98
	i32 352, ; 99
	i32 211, ; 100
	i32 350, ; 101
	i32 120, ; 102
	i32 384, ; 103
	i32 52, ; 104
	i32 44, ; 105
	i32 119, ; 106
	i32 304, ; 107
	i32 382, ; 108
	i32 310, ; 109
	i32 81, ; 110
	i32 136, ; 111
	i32 346, ; 112
	i32 291, ; 113
	i32 8, ; 114
	i32 73, ; 115
	i32 364, ; 116
	i32 155, ; 117
	i32 361, ; 118
	i32 154, ; 119
	i32 92, ; 120
	i32 356, ; 121
	i32 45, ; 122
	i32 379, ; 123
	i32 275, ; 124
	i32 367, ; 125
	i32 360, ; 126
	i32 109, ; 127
	i32 269, ; 128
	i32 180, ; 129
	i32 205, ; 130
	i32 210, ; 131
	i32 129, ; 132
	i32 25, ; 133
	i32 281, ; 134
	i32 72, ; 135
	i32 55, ; 136
	i32 46, ; 137
	i32 388, ; 138
	i32 247, ; 139
	i32 305, ; 140
	i32 22, ; 141
	i32 319, ; 142
	i32 209, ; 143
	i32 271, ; 144
	i32 201, ; 145
	i32 86, ; 146
	i32 43, ; 147
	i32 160, ; 148
	i32 71, ; 149
	i32 332, ; 150
	i32 210, ; 151
	i32 3, ; 152
	i32 42, ; 153
	i32 63, ; 154
	i32 16, ; 155
	i32 53, ; 156
	i32 391, ; 157
	i32 355, ; 158
	i32 220, ; 159
	i32 105, ; 160
	i32 267, ; 161
	i32 360, ; 162
	i32 353, ; 163
	i32 316, ; 164
	i32 211, ; 165
	i32 34, ; 166
	i32 158, ; 167
	i32 85, ; 168
	i32 32, ; 169
	i32 12, ; 170
	i32 51, ; 171
	i32 237, ; 172
	i32 56, ; 173
	i32 189, ; 174
	i32 336, ; 175
	i32 36, ; 176
	i32 232, ; 177
	i32 366, ; 178
	i32 354, ; 179
	i32 289, ; 180
	i32 35, ; 181
	i32 58, ; 182
	i32 234, ; 183
	i32 323, ; 184
	i32 189, ; 185
	i32 251, ; 186
	i32 175, ; 187
	i32 17, ; 188
	i32 357, ; 189
	i32 164, ; 190
	i32 222, ; 191
	i32 238, ; 192
	i32 177, ; 193
	i32 379, ; 194
	i32 322, ; 195
	i32 245, ; 196
	i32 183, ; 197
	i32 221, ; 198
	i32 279, ; 199
	i32 349, ; 200
	i32 224, ; 201
	i32 398, ; 202
	i32 385, ; 203
	i32 153, ; 204
	i32 235, ; 205
	i32 345, ; 206
	i32 330, ; 207
	i32 268, ; 208
	i32 224, ; 209
	i32 383, ; 210
	i32 291, ; 211
	i32 228, ; 212
	i32 29, ; 213
	i32 52, ; 214
	i32 264, ; 215
	i32 207, ; 216
	i32 381, ; 217
	i32 188, ; 218
	i32 350, ; 219
	i32 5, ; 220
	i32 365, ; 221
	i32 397, ; 222
	i32 340, ; 223
	i32 208, ; 224
	i32 344, ; 225
	i32 214, ; 226
	i32 296, ; 227
	i32 361, ; 228
	i32 288, ; 229
	i32 307, ; 230
	i32 85, ; 231
	i32 349, ; 232
	i32 61, ; 233
	i32 112, ; 234
	i32 57, ; 235
	i32 395, ; 236
	i32 336, ; 237
	i32 99, ; 238
	i32 19, ; 239
	i32 300, ; 240
	i32 111, ; 241
	i32 101, ; 242
	i32 102, ; 243
	i32 363, ; 244
	i32 104, ; 245
	i32 353, ; 246
	i32 71, ; 247
	i32 38, ; 248
	i32 32, ; 249
	i32 236, ; 250
	i32 103, ; 251
	i32 73, ; 252
	i32 272, ; 253
	i32 369, ; 254
	i32 9, ; 255
	i32 123, ; 256
	i32 46, ; 257
	i32 290, ; 258
	i32 248, ; 259
	i32 9, ; 260
	i32 43, ; 261
	i32 4, ; 262
	i32 337, ; 263
	i32 373, ; 264
	i32 253, ; 265
	i32 368, ; 266
	i32 237, ; 267
	i32 204, ; 268
	i32 31, ; 269
	i32 138, ; 270
	i32 92, ; 271
	i32 93, ; 272
	i32 388, ; 273
	i32 274, ; 274
	i32 49, ; 275
	i32 141, ; 276
	i32 201, ; 277
	i32 112, ; 278
	i32 140, ; 279
	i32 174, ; 280
	i32 306, ; 281
	i32 115, ; 282
	i32 354, ; 283
	i32 157, ; 284
	i32 399, ; 285
	i32 76, ; 286
	i32 79, ; 287
	i32 326, ; 288
	i32 37, ; 289
	i32 348, ; 290
	i32 176, ; 291
	i32 256, ; 292
	i32 310, ; 293
	i32 303, ; 294
	i32 64, ; 295
	i32 138, ; 296
	i32 15, ; 297
	i32 116, ; 298
	i32 342, ; 299
	i32 351, ; 300
	i32 298, ; 301
	i32 48, ; 302
	i32 70, ; 303
	i32 80, ; 304
	i32 126, ; 305
	i32 223, ; 306
	i32 94, ; 307
	i32 121, ; 308
	i32 358, ; 309
	i32 26, ; 310
	i32 319, ; 311
	i32 97, ; 312
	i32 28, ; 313
	i32 294, ; 314
	i32 386, ; 315
	i32 364, ; 316
	i32 149, ; 317
	i32 169, ; 318
	i32 4, ; 319
	i32 98, ; 320
	i32 33, ; 321
	i32 93, ; 322
	i32 341, ; 323
	i32 243, ; 324
	i32 21, ; 325
	i32 41, ; 326
	i32 170, ; 327
	i32 380, ; 328
	i32 312, ; 329
	i32 372, ; 330
	i32 250, ; 331
	i32 217, ; 332
	i32 326, ; 333
	i32 357, ; 334
	i32 351, ; 335
	i32 331, ; 336
	i32 2, ; 337
	i32 193, ; 338
	i32 182, ; 339
	i32 134, ; 340
	i32 111, ; 341
	i32 401, ; 342
	i32 244, ; 343
	i32 279, ; 344
	i32 392, ; 345
	i32 281, ; 346
	i32 389, ; 347
	i32 58, ; 348
	i32 95, ; 349
	i32 256, ; 350
	i32 371, ; 351
	i32 39, ; 352
	i32 292, ; 353
	i32 401, ; 354
	i32 25, ; 355
	i32 94, ; 356
	i32 222, ; 357
	i32 89, ; 358
	i32 99, ; 359
	i32 10, ; 360
	i32 203, ; 361
	i32 191, ; 362
	i32 87, ; 363
	i32 185, ; 364
	i32 100, ; 365
	i32 338, ; 366
	i32 186, ; 367
	i32 229, ; 368
	i32 358, ; 369
	i32 283, ; 370
	i32 257, ; 371
	i32 239, ; 372
	i32 194, ; 373
	i32 368, ; 374
	i32 7, ; 375
	i32 323, ; 376
	i32 363, ; 377
	i32 280, ; 378
	i32 0, ; 379
	i32 251, ; 380
	i32 88, ; 381
	i32 318, ; 382
	i32 154, ; 383
	i32 367, ; 384
	i32 268, ; 385
	i32 33, ; 386
	i32 191, ; 387
	i32 249, ; 388
	i32 116, ; 389
	i32 277, ; 390
	i32 82, ; 391
	i32 195, ; 392
	i32 199, ; 393
	i32 203, ; 394
	i32 20, ; 395
	i32 11, ; 396
	i32 162, ; 397
	i32 3, ; 398
	i32 261, ; 399
	i32 375, ; 400
	i32 247, ; 401
	i32 200, ; 402
	i32 244, ; 403
	i32 84, ; 404
	i32 233, ; 405
	i32 362, ; 406
	i32 64, ; 407
	i32 246, ; 408
	i32 377, ; 409
	i32 345, ; 410
	i32 143, ; 411
	i32 190, ; 412
	i32 327, ; 413
	i32 157, ; 414
	i32 223, ; 415
	i32 255, ; 416
	i32 41, ; 417
	i32 117, ; 418
	i32 230, ; 419
	i32 282, ; 420
	i32 371, ; 421
	i32 240, ; 422
	i32 334, ; 423
	i32 198, ; 424
	i32 184, ; 425
	i32 131, ; 426
	i32 75, ; 427
	i32 66, ; 428
	i32 381, ; 429
	i32 172, ; 430
	i32 286, ; 431
	i32 143, ; 432
	i32 198, ; 433
	i32 204, ; 434
	i32 106, ; 435
	i32 151, ; 436
	i32 70, ; 437
	i32 196, ; 438
	i32 156, ; 439
	i32 254, ; 440
	i32 229, ; 441
	i32 121, ; 442
	i32 127, ; 443
	i32 376, ; 444
	i32 152, ; 445
	i32 309, ; 446
	i32 240, ; 447
	i32 400, ; 448
	i32 141, ; 449
	i32 296, ; 450
	i32 220, ; 451
	i32 373, ; 452
	i32 20, ; 453
	i32 14, ; 454
	i32 207, ; 455
	i32 135, ; 456
	i32 178, ; 457
	i32 75, ; 458
	i32 59, ; 459
	i32 299, ; 460
	i32 167, ; 461
	i32 168, ; 462
	i32 259, ; 463
	i32 15, ; 464
	i32 74, ; 465
	i32 6, ; 466
	i32 23, ; 467
	i32 321, ; 468
	i32 280, ; 469
	i32 195, ; 470
	i32 179, ; 471
	i32 91, ; 472
	i32 374, ; 473
	i32 1, ; 474
	i32 136, ; 475
	i32 322, ; 476
	i32 344, ; 477
	i32 134, ; 478
	i32 69, ; 479
	i32 146, ; 480
	i32 235, ; 481
	i32 215, ; 482
	i32 383, ; 483
	i32 187, ; 484
	i32 362, ; 485
	i32 197, ; 486
	i32 313, ; 487
	i32 245, ; 488
	i32 88, ; 489
	i32 96, ; 490
	i32 303, ; 491
	i32 308, ; 492
	i32 378, ; 493
	i32 31, ; 494
	i32 273, ; 495
	i32 45, ; 496
	i32 317, ; 497
	i32 192, ; 498
	i32 225, ; 499
	i32 254, ; 500
	i32 173, ; 501
	i32 276, ; 502
	i32 282, ; 503
	i32 109, ; 504
	i32 158, ; 505
	i32 35, ; 506
	i32 22, ; 507
	i32 174, ; 508
	i32 114, ; 509
	i32 57, ; 510
	i32 342, ; 511
	i32 144, ; 512
	i32 118, ; 513
	i32 120, ; 514
	i32 218, ; 515
	i32 110, ; 516
	i32 284, ; 517
	i32 139, ; 518
	i32 179, ; 519
	i32 290, ; 520
	i32 250, ; 521
	i32 54, ; 522
	i32 105, ; 523
	i32 384, ; 524
	i32 265, ; 525
	i32 226, ; 526
	i32 260, ; 527
	i32 261, ; 528
	i32 133, ; 529
	i32 356, ; 530
	i32 347, ; 531
	i32 335, ; 532
	i32 390, ; 533
	i32 313, ; 534
	i32 266, ; 535
	i32 263, ; 536
	i32 159, ; 537
	i32 369, ; 538
	i32 300, ; 539
	i32 163, ; 540
	i32 132, ; 541
	i32 335, ; 542
	i32 161, ; 543
	i32 382, ; 544
	i32 324, ; 545
	i32 278, ; 546
	i32 225, ; 547
	i32 140, ; 548
	i32 193, ; 549
	i32 347, ; 550
	i32 343, ; 551
	i32 169, ; 552
	i32 262, ; 553
	i32 276, ; 554
	i32 285, ; 555
	i32 352, ; 556
	i32 40, ; 557
	i32 311, ; 558
	i32 81, ; 559
	i32 56, ; 560
	i32 37, ; 561
	i32 97, ; 562
	i32 166, ; 563
	i32 172, ; 564
	i32 348, ; 565
	i32 82, ; 566
	i32 287, ; 567
	i32 277, ; 568
	i32 185, ; 569
	i32 98, ; 570
	i32 30, ; 571
	i32 159, ; 572
	i32 270, ; 573
	i32 18, ; 574
	i32 127, ; 575
	i32 119, ; 576
	i32 187, ; 577
	i32 307, ; 578
	i32 338, ; 579
	i32 397, ; 580
	i32 190, ; 581
	i32 320, ; 582
	i32 270, ; 583
	i32 183, ; 584
	i32 340, ; 585
	i32 165, ; 586
	i32 315, ; 587
	i32 398, ; 588
	i32 178, ; 589
	i32 273, ; 590
	i32 192, ; 591
	i32 402, ; 592
	i32 206, ; 593
	i32 337, ; 594
	i32 328, ; 595
	i32 170, ; 596
	i32 16, ; 597
	i32 227, ; 598
	i32 144, ; 599
	i32 375, ; 600
	i32 257, ; 601
	i32 125, ; 602
	i32 249, ; 603
	i32 118, ; 604
	i32 38, ; 605
	i32 115, ; 606
	i32 215, ; 607
	i32 47, ; 608
	i32 142, ; 609
	i32 117, ; 610
	i32 34, ; 611
	i32 175, ; 612
	i32 200, ; 613
	i32 184, ; 614
	i32 95, ; 615
	i32 53, ; 616
	i32 181, ; 617
	i32 329, ; 618
	i32 129, ; 619
	i32 153, ; 620
	i32 227, ; 621
	i32 24, ; 622
	i32 161, ; 623
	i32 306, ; 624
	i32 278, ; 625
	i32 148, ; 626
	i32 104, ; 627
	i32 213, ; 628
	i32 89, ; 629
	i32 294, ; 630
	i32 60, ; 631
	i32 142, ; 632
	i32 100, ; 633
	i32 5, ; 634
	i32 13, ; 635
	i32 122, ; 636
	i32 135, ; 637
	i32 216, ; 638
	i32 28, ; 639
	i32 370, ; 640
	i32 253, ; 641
	i32 72, ; 642
	i32 304, ; 643
	i32 24, ; 644
	i32 292, ; 645
	i32 333, ; 646
	i32 330, ; 647
	i32 387, ; 648
	i32 137, ; 649
	i32 285, ; 650
	i32 301, ; 651
	i32 168, ; 652
	i32 255, ; 653
	i32 334, ; 654
	i32 366, ; 655
	i32 101, ; 656
	i32 123, ; 657
	i32 305, ; 658
	i32 236, ; 659
	i32 231, ; 660
	i32 163, ; 661
	i32 167, ; 662
	i32 308, ; 663
	i32 39, ; 664
	i32 258, ; 665
	i32 374, ; 666
	i32 17, ; 667
	i32 171, ; 668
	i32 387, ; 669
	i32 386, ; 670
	i32 137, ; 671
	i32 150, ; 672
	i32 297, ; 673
	i32 155, ; 674
	i32 130, ; 675
	i32 19, ; 676
	i32 65, ; 677
	i32 221, ; 678
	i32 269, ; 679
	i32 147, ; 680
	i32 173, ; 681
	i32 47, ; 682
	i32 274, ; 683
	i32 394, ; 684
	i32 242, ; 685
	i32 283, ; 686
	i32 79, ; 687
	i32 61, ; 688
	i32 239, ; 689
	i32 106, ; 690
	i32 332, ; 691
	i32 287, ; 692
	i32 49, ; 693
	i32 318, ; 694
	i32 391, ; 695
	i32 329, ; 696
	i32 14, ; 697
	i32 230, ; 698
	i32 68, ; 699
	i32 171, ; 700
	i32 399, ; 701
	i32 293, ; 702
	i32 297, ; 703
	i32 196, ; 704
	i32 271, ; 705
	i32 396, ; 706
	i32 252, ; 707
	i32 78, ; 708
	i32 302, ; 709
	i32 108, ; 710
	i32 286, ; 711
	i32 328, ; 712
	i32 67, ; 713
	i32 63, ; 714
	i32 27, ; 715
	i32 160, ; 716
	i32 246, ; 717
	i32 242, ; 718
	i32 295, ; 719
	i32 10, ; 720
	i32 258, ; 721
	i32 11, ; 722
	i32 275, ; 723
	i32 78, ; 724
	i32 126, ; 725
	i32 206, ; 726
	i32 83, ; 727
	i32 232, ; 728
	i32 66, ; 729
	i32 107, ; 730
	i32 65, ; 731
	i32 128, ; 732
	i32 122, ; 733
	i32 77, ; 734
	i32 343, ; 735
	i32 333, ; 736
	i32 395, ; 737
	i32 194, ; 738
	i32 8, ; 739
	i32 301, ; 740
	i32 241, ; 741
	i32 2, ; 742
	i32 44, ; 743
	i32 346, ; 744
	i32 156, ; 745
	i32 128, ; 746
	i32 331, ; 747
	i32 23, ; 748
	i32 133, ; 749
	i32 241, ; 750
	i32 289, ; 751
	i32 320, ; 752
	i32 390, ; 753
	i32 372, ; 754
	i32 29, ; 755
	i32 288, ; 756
	i32 62, ; 757
	i32 219, ; 758
	i32 212, ; 759
	i32 264, ; 760
	i32 260, ; 761
	i32 90, ; 762
	i32 87, ; 763
	i32 148, ; 764
	i32 238, ; 765
	i32 262, ; 766
	i32 36, ; 767
	i32 86, ; 768
	i32 309, ; 769
	i32 228, ; 770
	i32 385, ; 771
	i32 199, ; 772
	i32 380, ; 773
	i32 231, ; 774
	i32 50, ; 775
	i32 6, ; 776
	i32 180, ; 777
	i32 90, ; 778
	i32 392, ; 779
	i32 21, ; 780
	i32 162, ; 781
	i32 96, ; 782
	i32 50, ; 783
	i32 209, ; 784
	i32 186, ; 785
	i32 113, ; 786
	i32 325, ; 787
	i32 400, ; 788
	i32 130, ; 789
	i32 226, ; 790
	i32 218, ; 791
	i32 76, ; 792
	i32 27, ; 793
	i32 181, ; 794
	i32 219, ; 795
	i32 302, ; 796
	i32 324, ; 797
	i32 202, ; 798
	i32 7, ; 799
	i32 272, ; 800
	i32 259, ; 801
	i32 110, ; 802
	i32 208, ; 803
	i32 325, ; 804
	i32 311 ; 805
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
