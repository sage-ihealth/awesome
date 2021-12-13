local pipelineiOS(branch, instance) = {
    kind: 'pipeline',
    type: 'exec',
    name: 'iOS',
    clone: {
        'disable': true
    },
    steps: [
        {
            name: "fastlane-iOS",
            commands: [
                'pwd',
                'source ~/.bash_profile',
                ' /usr/bin/which node',
                'export HOME=/Users/sagegu; cd /Users/sagegu/Documents/GitHub/sage/AwesomeProject',
               // 'export HOME=/Users/iHealth; cd /Users/iHealth/Documents/GitHub/ShareCareMobile-iOS;',
                './scripts/ios.sh test'
            ],
            when: {
                event: ["pull_request"]
            }
        }
    ],
     platform:{
        os: "darwin",
        arch: "amd64",
    },
    node: {
        runner: "sage"
    },
    trigger:{
        branch: branch
    },
    image_pull_secrets: ["dockerconfigjson"]
};

local pipelineAndriod(branch, instance) = {
    kind: 'pipeline',
    type: 'exec',
    name: 'android',
    // clone: {
    //     'disable': true
    // },
    steps: [
        {
            name: "fastlane-android",
            commands: [
                'which node',
                // 'export HOME=/Users/sagegu; cd /Users/sagegu/Documents/GitHub/sage/ShareCareMobile; ./scripts/android.sh test'
                // 'export HOME=/Users/iHealth; cd /Users/iHealth/Documents/GitHub/ShareCareMobile-Android; ',
                // 'git fetch origin +refs/heads/master; git checkout master; git fetch origin refs/pull/536/head; git merge ${DRONE_COMMIT_SHA}',

                 './scripts/android.sh test'
            ],
            when: {
                event: ["pull_request"]
            }
        }
    ],
     platform:{
        os: "darwin",
        arch: "amd64",
    },
    node: {
        runner: "mac"
    },
    trigger:{
        branch: branch
    },
    image_pull_secrets: ["dockerconfigjson"]
};

local dev_drone = ["https://dev-drone.ihealth-eng.com"];
local test_drone = ["test-drone.ihealth-eng.com"];
local prod_drone = ["prod-drone.ihealth-eng.com"];
[
    pipelineiOS(branch="master",  instance=dev_drone),
    //pipelineAndriod(branch="master",  instance=dev_drone),
]
