## Three steps for InApp Purchase configuration

1. Configure InApp Products on App Store.
2. Configure InApp Products on Google Play Console.
3. Integrate rn-in-app library.

## Step 1:- Configuration on App Store

Goto ‘Agreement, Tax and Banking’ Section of iTunes -> Select paid Application
Contract type.

Go To Your App Dashboard -> Select Feature Section -> In App Purchase -> Add
your products (There will be + button).

Now In-App Purchase created, you need to add the Product ID to your app’s
control panel. In your app control panel -> go to the “Commerce” section from
the menu on the left -> Copy productID and paste here -> click on Add button to
save.

## Step 2:- Configure your app on Google Play Console

Note:- For settings in play console you have to upload apk on play console.

Go To Play Console -> Settings -> Activate your Merchant Account.

After Activate Merchant Account -> Go To Application Dashboard -> from side menu
select Development Tools -> select Services and APIs -> Copy the license key.

Link for add merchant account on play console:-
https://learn.buildfire.com/en/articles/499662-how-to-set-up-your-account-for-in-app-purchases-in-your-google-developer-account-for-android

Upload your license/billing key to the 'Commerce' section of your app’s control
panel.

Go To Play Console -> Application Dashboard -> From Side Menu Select 'Store
Presence' -> Expand Store Prsence and Select 'In App Purchase' -> Click on
Manage Products (Add your products here) and mark them in active state.

## Step 3:- Integrate rn-in-app library into your project

Go To your Project Directory:- yarn add react-native-iap Go To ios folder -> pod
install

In XCode settings, open Xcode and select project and goto Capabilities section
and enable InApp Purchase button.

In Android Manifest add following permission:-
<uses-permission android:name=”com.android.vending.BILLING” />

```javascript

import RNIap, {
  Product,
  ProductPurchase,
  PurchaseError,
  acknowledgePurchaseAndroid,
  purchaseErrorListener,
  purchaseUpdatedListener,
} from 'react-native-iap';

const productSkus = Platform.select({
  ios: ['com.demo.productId'],
  android: ['com.demo.productId'],
});

let purchaseUpdateSubscription;
let purchaseErrorSubscription;

const [receipt, setReceipt] = useState('');
const [products, setProductList] = useState([]);

UseEffect(async () => {
 try {
      const result = await RNIap.initConnection();
      console.log('init connection ----', result);
      await RNIap.consumeAllItemsAndroid();
    } catch (err) {
      console.log('err in init connection--- ', err);
    }
    purchaseUpdateSubscription = purchaseUpdatedListener(
      async (purchase) => {
        console.log('purchase update', purchase);
        if (
          purchase.purchaseStateAndroid === 1 &&
          !purchase.isAcknowledgedAndroid
        ) {
          try {
            const ackResult = await acknowledgePurchaseAndroid(
              purchase.purchaseToken,
            );
            console.log('acknowledge response', ackResult);
          } catch (ackErr) {
            console.warn('acknowledge error', ackErr);
          }
        }
        _purchaseConfirmed();
        setReceipt(purchase.transactionReceipt);
        purchaseErrorSubscription = purchaseErrorListener(
          (error) => {
            console.log('purchaseErrorListener', error);
            // alert('purchase error', JSON.stringify(error));
          },
        );
      },
    );
      return () => {
        if (purchaseUpdateSubscription) {
          purchaseUpdateSubscription.remove();
          purchaseUpdateSubscription = null;
        }
        if (purchaseErrorSubscription) {
          purchaseErrorSubscription.remove();
          purchaseErrorSubscription = null;
        }
      }
}, [])

const _purchaseConfirmed = () => {
   // Server api to send status of purchase.
};

const _getProductList = async () => {
  try {
    console.log('productSkus[0]====', productSkus[0]);
    const products = await RNIap.getProducts(productSkus);
    console.log('Products=======', products[0]);
    setProductList(products)
    _requestPurchase(productSkus[0]);
  } catch (err) {
    console.log('_getProductList purchase error ==== ', err);
  }
};

const _requestPurchase = async (sku) => {
  try {
    RNIap.requestPurchase(sku);
  } catch (err) {
    console.log('requestPurchase error => ', err);
  }
};

return (
  <View>
    <TouchableOpacity onPress={() => _getProductList();}>
      <Text>Check RNIAP</Text>
    </TouchableOpacity>
  </View>
)






```
