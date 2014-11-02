module HQsSpec where

import Network.HQs
import Test.Hspec

spec :: Spec
spec =
    describe "urlEncode" $ do
        it "encodes spaces as '%20'" $
            urlEncode "this is a field" `shouldBe` "this%20is%20a%20field"

        it "percent encodes special characters" $ do
            urlEncode "special chars: &%*"
                `shouldBe` "special%20chars%3a%20%26%25*"
            urlEncode "foo @+%/" `shouldBe` "foo%20%40%2b%25%2f"
