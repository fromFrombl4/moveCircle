import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var upButtonOutlet: UIButton!
    @IBOutlet weak var downButtonOutlet: UIButton!
    @IBOutlet weak var leftButtonOutlet: UIButton!
    @IBOutlet weak var rightButtonOutlet: UIButton!
    @IBOutlet weak var placeView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    let moveLength: CGFloat = 50
    
    weak var circleViewGlobal: UIView!
    
    enum Direction {
        case left
        case right
        case up
        case down
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        
        leftSwipe.direction = .left
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        
        rightSwipe.direction = .right
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        
        upSwipe.direction = .up
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        
        downSwipe.direction = .down
        
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
        
        
        
       let circleView = self.createCircleView()
       placeView.addSubview(circleView)
       circleView.center = placeView.center
        
       circleViewGlobal = circleView
        
    }
    
    func createCircleView() -> UIView{
    //
    //        let maxX: CGFloat = placeView.bounds.width - 100
    //        let maxY: CGFloat = placeView.bounds.height - 100
    //        let minX: CGFloat = placeView.bounds.width + 100
    //        let minY: CGFloat = placeView.bounds.height + 100
            
            let circleView = UIView()
            circleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            circleView.backgroundColor = UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            circleView.layer.cornerRadius = 50
            
            
            return circleView
            
        }
    
    func getDirectionText(_ direction: Direction) {
             
             switch direction {
             case .down:
                 messageLabel.text = "we're moving to down"
             case .up:
                 messageLabel.text = "we're moving to up"
             case .left:
                 messageLabel.text = "we're moving to the left"
             case .right:
                 messageLabel.text = "we're moving to the right"
     
         }
     }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                if circleViewGlobal.frame.origin.x + circleViewGlobal.frame.size.width < placeView.frame.size.width - moveLength{
                    circleViewGlobal.frame.origin.x += CGFloat(moveLength)
                    getDirectionText(.right)
                    
                } else {
                    messageLabel.text = "Can't move"
                }
            case .left:
                if circleViewGlobal.frame.origin.x > 0 + moveLength{
                    circleViewGlobal.frame.origin.x -= CGFloat(moveLength)
                    getDirectionText(.left)
                    
                } else {
                    messageLabel.text = "Can't move"
                }
            case .up:
                if circleViewGlobal.frame.origin.y >  0 + moveLength{
                    circleViewGlobal.frame.origin.y -= CGFloat(moveLength)
                    getDirectionText(.up)
                } else{
                    messageLabel.text = "Can't move"
                }
                
            case .down:
                if circleViewGlobal.frame.origin.y + circleViewGlobal.frame.size.height < placeView.frame.size.height - moveLength{
                    circleViewGlobal.frame.origin.y += CGFloat(moveLength)
                    getDirectionText(.down)
                } else{
                    messageLabel.text = "Can't move"
                }
                
            
            default:
                break
            }
    }
    
    
    
    
  /*
    @IBAction func pressedUpButton(_ sender: UIButton) {
//        guard let circleViewGlobal = circleViewGlobal else {
//            return
//        }
        
        if circleViewGlobal.frame.origin.y >  0 + moveLength{
            circleViewGlobal.frame.origin.y -= CGFloat(moveLength)
            getDirectionText(.up)
        } else{
            messageLabel.text = "Can't move"
        }
        
    }
    
    @IBAction func pressedDownButton(_ sender: UIButton) {
//        guard let circleViewGlobal = circleViewGlobal else {
//            return
//        }
        
        if circleViewGlobal.frame.origin.y + circleViewGlobal.frame.size.height < placeView.frame.size.height - moveLength{
            circleViewGlobal.frame.origin.y += CGFloat(moveLength)
            getDirectionText(.down)
        } else{
            messageLabel.text = "Can't move"
        }
    }
    
    @IBAction func pressedLeftButton(_ sender: UIButton) {
        
//        guard let circleViewGlobal = circleViewGlobal else {
//            return
//        }
        
        if circleViewGlobal.frame.origin.x > 0 + moveLength{
            circleViewGlobal.frame.origin.x -= CGFloat(moveLength)
            getDirectionText(.left)
        } else {
            messageLabel.text = "Can't move"
        }
    }
    
    @IBAction func pressedRightButton(_ sender: UIButton) {
        
//        guard let circleViewGlobal = circleViewGlobal else {
//            return
//        }
        
        if circleViewGlobal.frame.origin.x + circleViewGlobal.frame.size.width < placeView.frame.size.width - moveLength{
            circleViewGlobal.frame.origin.x += CGFloat(moveLength)
            getDirectionText(.right)
        } else {
            messageLabel.text = "Can't move"
        }
    }
    
  */
 
    

}
}
