import UIKit

struct Personality {
    let personality:String
    let color:String
    let image:String
}

let lipsticks:Array<Personality> = [
    Personality(personality: "自信", color: "大紅色、深莓果色", image: "red"),
    Personality(personality: "可愛", color: "粉紅、桃紅色", image: "pink"),
    Personality(personality: "內斂", color: "裸色" , image: "nude"),
    Personality(personality: "樂觀", color: "橘色", image: "orange"),
    Personality(personality: "沈穩", color: "土棕色", image: "brown")]

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchOutlet.isOn = false
        nameTextField.delegate = self
        imageView.contentMode = .scaleAspectFill
    }
    
    func updateAnswer() {
        if switchOutlet.isOn == true {
            welcomeLabel.text = "Hi \(nameTextField.text!), 適合妳的顏色是\(lipsticks[segmentedOutlet.selectedSegmentIndex].color)"
            imageView.image = UIImage(named: lipsticks[segmentedOutlet.selectedSegmentIndex].image)
            imageView.layer.borderWidth = 10
            imageView.layer.borderColor = CGColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
        }else{
            welcomeLabel.text = "Hi \(nameTextField.text!), 沒錢買不起就別再看了"
            imageView.image = UIImage(named: "koreaFish")
            imageView.layer.borderWidth = 10
            imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        }
    }
    
    //按下適合我的顏色Button
    @IBAction func testButton(_ sender: UIButton) {
        //當沒有輸入nameTextField時，顯示text並跳出
        if nameTextField.text == "" {
            welcomeLabel.text = "我想知道妳的名字"
            return
        }
        //當沒有選擇selectedSegmentIndex時，顯示text並跳出
        if segmentedOutlet.selectedSegmentIndex == -1 {
            welcomeLabel.text = "我想知道妳的個性"
            return
        }
        updateAnswer()
    }
    
    //鍵盤按下return後下降
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    //按下再測一次Button
    @IBAction func retryButton(_ sender: UIButton) {
        welcomeLabel.text = ""
        imageView.image = nil
        switchOutlet.isOn = false
        nameTextField.text = ""
        segmentedOutlet.selectedSegmentIndex = -1
        imageView.layer.borderWidth = 0
    }
}
