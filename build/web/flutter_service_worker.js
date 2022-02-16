'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b077a2f0e66c26824d1aab50fee3a1ab",
"assets/assets/icons/Documents.svg": "0d66436fde3818811c82319665ef91fd",
"assets/assets/icons/drop_box.svg": "d427e188a7aee4612446d0e9d26e76f1",
"assets/assets/icons/folder.svg": "8c11f522cd36f0cbd9c02eb2b689cbb9",
"assets/assets/icons/logo.svg": "6194acb4fae31a2a2ee26ff61d8c644e",
"assets/assets/icons/media.svg": "e790cb1d2138f7a9d1b404abf8346eb1",
"assets/assets/icons/menu_dashbord.svg": "5e8d164243b3e28c22a8a5e35719c96e",
"assets/assets/icons/menu_doc.svg": "c5a576281e34f54d9e041410d002443c",
"assets/assets/icons/menu_notification.svg": "f49436dd0acd00dc43ab287c7ac3ff4f",
"assets/assets/icons/menu_profile.svg": "134c2274ffaca9441fe7523b2f476608",
"assets/assets/icons/menu_setting.svg": "32ab0402dc07a66d078c758ddb0aa798",
"assets/assets/icons/menu_store.svg": "45f31f1388616a22053ea6a99ed5904a",
"assets/assets/icons/menu_task.svg": "fa731cbcb073759bd82c699331ef7e93",
"assets/assets/icons/menu_tran.svg": "acdaeac5ea677c4a479a1d656ea3d5c1",
"assets/assets/icons/Search.svg": "82ad5e39b306dc6a42809cbeef651e64",
"assets/assets/icons/unknown.svg": "2fc91e195e7a0d6279c01552403c3b89",
"assets/assets/images/bg.png": "4dfd3907dacb2154d0d0a71010cb5234",
"assets/assets/images/mockup-2.png": "43ca138b1424c2cd672abe8e0fedc204",
"assets/assets/images/mockup-3.png": "22734f8af1b16dd47b4cd5c326f09203",
"assets/assets/images/mockup.png": "2ec9e0b08217f7a2383a961ce73c0e63",
"assets/assets/images/profile_pic.png": "14fadd39309977174ebbf611aa064f64",
"assets/assets/logo/logo.png": "2af7b2e72abedc2bce98944653429354",
"assets/assets/logo/logo.svg": "9ea047f78b876895c33cdafd6087fd05",
"assets/assets/logo/logo_icon.jpg": "b82c55663605f107a8e45d1bcbe7cd14",
"assets/assets/logo/logo_icon.png": "b50999dc250aa84eeb1d3b9f47ce3cc8",
"assets/assets/logo/logo_name.svg": "5d4852f0217d0205c68baa9395a2f67c",
"assets/assets/logo/logo_text.png": "0b78ae381bd4c66c0394fc37cea78284",
"assets/assets/slides/background-1.JPEG": "e646b95ba01237bdebf5e27be42c907b",
"assets/assets/slides/background-1.jpg": "a483ef905c7ec8ae3fd5e92bf429a84a",
"assets/assets/slides/background-2.jpeg": "e9de650b24e6205c8ff749a511e16d8e",
"assets/assets/slides/background-3.jpeg": "f856a88fbd12c6bb96dd084123ffcb2a",
"assets/assets/slides/background-4.jpeg": "f8ed4d3704b14706eb036222b7ca4045",
"assets/assets/slides/background-5.jpeg": "2a495deff8fae15f2b30f535d1576ca1",
"assets/assets/slides/background-6.jpeg": "a1789d9a53f146cb6178e9db14b5e244",
"assets/assets/slides/background.jpeg": "d9418faee4ffef09d5142d2281040011",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "36d1c20a6ab0ea47abc58bb3ecc844f3",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"favicon-.png": "5dcef449791fa27946b3d35ad8803796",
"favicon-32x32.png": "d42369960bb9b6e1dcd761f0a8f2d46a",
"favicon.ico": "3f125be354f14392e483e7c279fe5eca",
"favicon.png": "9be892d9878784c3b0a169a35d52692e",
"icons/android-chrome-192x192.png": "af91d409200f66102c1fc53a03ff45c7",
"icons/android-chrome-512x512.png": "6c37f5fe127e52caa611a90a08e89039",
"icons/apple-touch-icon.png": "90c9891eb7bdcd79611a061dcdfb9e57",
"icons/Icon-192-.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192.png": "b50999dc250aa84eeb1d3b9f47ce3cc8",
"icons/Icon-512-.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512.png": "b50999dc250aa84eeb1d3b9f47ce3cc8",
"icons/Icon-maskable-192-.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-192.png": "b50999dc250aa84eeb1d3b9f47ce3cc8",
"icons/Icon-maskable-512-.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512.png": "b50999dc250aa84eeb1d3b9f47ce3cc8",
"index.html": "6fd518713498f90d651771000a5ff753",
"/": "6fd518713498f90d651771000a5ff753",
"main.dart.js": "8a4ae1602f1d620f8864f0527ebcee65",
"manifest.json": "4cd5a43fcee704687e561d6d88637f7b",
"version.json": "6a2315c9dd28bedf697fd8f48215c3e3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
